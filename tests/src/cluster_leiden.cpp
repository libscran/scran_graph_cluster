#include <gtest/gtest.h>

#include "mock_clusters.h"

#include <vector>

#include "scran_graph_cluster/cluster_leiden.hpp"

TEST(ClusterLeiden, Basic) {
    size_t ncells = 488;
    auto mock = mock_clusters(ncells, 8);

    auto output = scran_graph_cluster::cluster_leiden(mock.first, mock.second, scran_graph_cluster::ClusterLeidenOptions());
    EXPECT_EQ(output.membership.size(), ncells);
    check_multiple_clusters(output.membership);
}

TEST(ClusterLeiden, Parameters) {
    auto mock = mock_clusters(988, 3);

    scran_graph_cluster::ClusterLeidenOptions opts;
    auto output1 = scran_graph_cluster::cluster_leiden(mock.first, mock.second, opts);

    // Responds to changes in the parameters.
    {
        scran_graph_cluster::ClusterLeidenOptions opts;
        opts.resolution = 0.5;
        auto output2 = scran_graph_cluster::cluster_leiden(mock.first, mock.second, opts);
        EXPECT_TRUE(compare_clusters(output1.membership, output2.membership));
    }

    {
        scran_graph_cluster::ClusterLeidenOptions opts;
        opts.modularity = true;
        auto output2 = scran_graph_cluster::cluster_leiden(mock.first, mock.second, opts);
        EXPECT_TRUE(compare_clusters(output1.membership, output2.membership));
    }

    // We can disable reporting.
    {
        scran_graph_cluster::ClusterLeidenOptions opts;
        opts.report_quality = false;
        auto output = scran_graph_cluster::cluster_leiden(mock.first, mock.second, opts);
        EXPECT_EQ(output.quality, 0);
    }

    // Seed gives reproducible results.
    {
        auto output2 = scran_graph_cluster::cluster_leiden(mock.first, mock.second, opts);
        EXPECT_FALSE(compare_clusters(output1.membership, output2.membership));
    }
}

TEST(ClusterLeiden, Sanity) {
    size_t ncells = 1212;
    size_t nclusters = 4;
    auto mock = mock_clusters(ncells, nclusters, 0.5, 0);

    {
        scran_graph_cluster::ClusterLeidenOptions opts;
        opts.modularity = true;
        auto output = scran_graph_cluster::cluster_leiden(mock.first, mock.second, opts);
        validate(output.membership, nclusters);
    }

    {
        scran_graph_cluster::ClusterLeidenOptions opts;
        opts.resolution = 0.1;
        auto output = scran_graph_cluster::cluster_leiden(mock.first, mock.second, opts);
        validate(output.membership, nclusters);
    }
}

TEST(ClusterLeiden, Unweighted) {
    auto mock = mock_clusters(899, 6);

    scran_graph_cluster::ClusterLeidenResults output;
    scran_graph_cluster::ClusterLeidenOptions opts;
    scran_graph_cluster::cluster_leiden(mock.first.get(), NULL, opts, output);
    EXPECT_EQ(output.membership.size(), 899);

    opts.modularity = true;
    scran_graph_cluster::cluster_leiden(mock.first.get(), NULL, opts, output);
    EXPECT_EQ(output.membership.size(), 899);
}
