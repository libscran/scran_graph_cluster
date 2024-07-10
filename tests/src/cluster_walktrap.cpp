#include <gtest/gtest.h>

#include "mock_clusters.h"

#include <vector>

#include "cluster_walktrap.hpp"

TEST(ClusterWalktrap, Basic) {
    size_t ncells = 488;
    auto mock = mock_clusters(ncells, 8);

    auto output = scran::cluster_walktrap::compute(mock.first, mock.second, scran::cluster_walktrap::Options());
    EXPECT_EQ(output.membership.size(), ncells);
    EXPECT_TRUE(output.merges.size() > 0);
    EXPECT_EQ(output.merges.nrow() + 1, output.modularity.size());

    check_multiple_clusters(output.membership);
}

TEST(ClusterWalktrap, Parameters) {
    auto mock = mock_clusters(988, 6);

    {
        scran::cluster_walktrap::Options opts;
        auto output1 = scran::cluster_walktrap::compute(mock.first, mock.second, opts);
        opts.steps = 8;
        auto output2 = scran::cluster_walktrap::compute(mock.first, mock.second, opts);
        EXPECT_TRUE(compare_clusters(output1.membership, output2.membership));
    }

    // Make sure it's reproducible for a range of steps.
    std::vector<int> steps{3, 5, 8};
    for (auto s : steps) {
        scran::cluster_walktrap::Options opts;
        opts.steps = s;
        auto output1 = scran::cluster_walktrap::compute(mock.first, mock.second, opts);
        auto output2 = scran::cluster_walktrap::compute(mock.first, mock.second, opts);
        EXPECT_FALSE(compare_clusters(output1.membership, output2.membership));
    }

    // We can disable reporting.
    {
        scran::cluster_walktrap::Options opts;
        opts.report_merges = false;
        opts.report_modularity = false;
        auto output = scran::cluster_walktrap::compute(mock.first, mock.second, opts);
        EXPECT_EQ(output.merges.size(), 0);
        EXPECT_EQ(output.modularity.size(), 0);
    }
}

TEST(ClusterWalktrap, Sanity) {
    size_t ncells = 1212;
    size_t nclusters = 8;
    auto mock = mock_clusters(ncells, nclusters, 0.1, 0);

    scran::cluster_walktrap::Options opts;
    auto output = scran::cluster_walktrap::compute(mock.first, mock.second, opts);
    validate(output.membership, nclusters);
}
