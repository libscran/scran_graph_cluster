#include <gtest/gtest.h>

#include "mock_clusters.h"

#include <vector>

#include "cluster_leiden.hpp"

TEST(ClusterLeiden, Basic) {
    size_t ncells = 488;
    auto mock = mock_clusters(ncells, 8);

    auto output = scran::cluster_leiden::compute(mock.first, mock.second, scran::cluster_leiden::Options());
    EXPECT_EQ(output.membership.size(), ncells);
    check_multiple_clusters(output.membership);
}

TEST(ClusterLeiden, Parameters) {
    auto mock = mock_clusters(988, 3);

    scran::cluster_leiden::Options opts;
    auto output1 = scran::cluster_leiden::compute(mock.first, mock.second, opts);

    // Responds to changes in the parameters.
    {
        scran::cluster_leiden::Options opts;
        opts.resolution = 0.5;
        auto output2 = scran::cluster_leiden::compute(mock.first, mock.second, opts);
        EXPECT_TRUE(compare_clusters(output1.membership, output2.membership));
    }

    {
        scran::cluster_leiden::Options opts;
        opts.modularity = true;
        auto output2 = scran::cluster_leiden::compute(mock.first, mock.second, opts);
        EXPECT_TRUE(compare_clusters(output1.membership, output2.membership));
    }

    // We can disable reporting.
    {
        scran::cluster_leiden::Options opts;
        opts.report_quality = false;
        auto output = scran::cluster_leiden::compute(mock.first, mock.second, opts);
        EXPECT_EQ(output.quality, 0);
    }

    // Seed gives reproducible results.
    {
        auto output2 = scran::cluster_leiden::compute(mock.first, mock.second, opts);
        EXPECT_FALSE(compare_clusters(output1.membership, output2.membership));
    }
}

TEST(ClusterLeiden, Sanity) {
    size_t ncells = 1212;
    size_t nclusters = 4;
    auto mock = mock_clusters(ncells, nclusters, 0.5, 0);

    scran::cluster_leiden::Options opts;
    opts.resolution = 0.5;
    auto output = scran::cluster_leiden::compute(mock.first, mock.second, opts);
    validate(output.membership, nclusters);
}
