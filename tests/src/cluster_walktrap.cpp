#include <gtest/gtest.h>

#include "mock_clusters.h"

#include <vector>

#include "scran_graph_cluster/cluster_walktrap.hpp"

TEST(ClusterWalktrap, Basic) {
    size_t ncells = 488;
    auto mock = mock_clusters(ncells, 8);

    auto output = scran_graph_cluster::cluster_walktrap(mock.first, mock.second, scran_graph_cluster::ClusterWalktrapOptions());
    EXPECT_EQ(output.membership.size(), ncells);
    EXPECT_TRUE(output.merges.size() > 0);
    EXPECT_EQ(output.merges.nrow() + 1, output.modularity.size());

    check_multiple_clusters(output.membership);
}

TEST(ClusterWalktrap, Parameters) {
    auto mock = mock_clusters(988, 6);

    {
        scran_graph_cluster::ClusterWalktrapOptions opts;
        auto output1 = scran_graph_cluster::cluster_walktrap(mock.first, mock.second, opts);
        opts.steps = 8;
        auto output2 = scran_graph_cluster::cluster_walktrap(mock.first, mock.second, opts);
        EXPECT_TRUE(compare_clusters(output1.membership, output2.membership));
    }

    // Make sure it's reproducible for a range of steps.
    std::vector<int> steps{3, 5, 8};
    for (auto s : steps) {
        scran_graph_cluster::ClusterWalktrapOptions opts;
        opts.steps = s;
        auto output1 = scran_graph_cluster::cluster_walktrap(mock.first, mock.second, opts);
        auto output2 = scran_graph_cluster::cluster_walktrap(mock.first, mock.second, opts);
        EXPECT_FALSE(compare_clusters(output1.membership, output2.membership));
    }

    // We can disable reporting.
    {
        scran_graph_cluster::ClusterWalktrapOptions opts;
        opts.report_merges = false;
        opts.report_modularity = false;
        auto output = scran_graph_cluster::cluster_walktrap(mock.first, mock.second, opts);
        EXPECT_EQ(output.merges.size(), 0);
        EXPECT_EQ(output.modularity.size(), 0);
    }
}

TEST(ClusterWalktrap, Sanity) {
    size_t ncells = 1212;
    size_t nclusters = 8;
    auto mock = mock_clusters(ncells, nclusters, 0.1, 0);

    scran_graph_cluster::ClusterWalktrapOptions opts;
    auto output = scran_graph_cluster::cluster_walktrap(mock.first, mock.second, opts);
    validate(output.membership, nclusters);
}

TEST(ClusterWalktrap, Unweighted) {
    auto mock = mock_clusters(899, 6);

    scran_graph_cluster::ClusterWalktrapResults output;
    scran_graph_cluster::ClusterWalktrapOptions opts;
    scran_graph_cluster::cluster_walktrap(mock.first.get(), NULL, opts, output);
    EXPECT_EQ(output.membership.size(), 899);
}
