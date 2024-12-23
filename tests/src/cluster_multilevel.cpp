#include <gtest/gtest.h>

#include "mock_clusters.h"

#include "scran_graph_cluster/cluster_multilevel.hpp"

TEST(ClusterMultilevel, Basic) {
    size_t ncells = 505;
    auto mock = mock_clusters(ncells, 7);

    auto output = scran_graph_cluster::cluster_multilevel(mock.first, mock.second, scran_graph_cluster::ClusterMultilevelOptions());
    EXPECT_EQ(output.membership.size(), ncells);
    EXPECT_EQ(output.levels.ncol(), ncells);
    EXPECT_TRUE(output.modularity.size() > 1);

    size_t nlevels = output.levels.nrow();
    EXPECT_EQ(output.modularity.size(), nlevels);

    // Checking that the maximum modularity is consistent. 
    {
        auto maxed = igraph_vector_which_max(output.modularity.get());
        auto maxrow = raiigraph::IntegerVector(ncells);
        igraph_matrix_int_get_row(output.levels.get(), maxrow.get(), maxed);
        EXPECT_FALSE(compare_clusters(maxrow, output.membership));
    }

    // Actually generates multiple clusters.
    bool has_multiple = false;
    auto& levels = *(output.levels.get());
    for (size_t l = 0; l < nlevels; ++l) {
        for (size_t i = 0; i < ncells; ++i) {
            if (MATRIX(levels, l, i) >  0) {
                has_multiple = true;
                break;
            }
        }
        if (has_multiple) {
            break;
        }
    }
    EXPECT_TRUE(has_multiple);
}

TEST(ClusterMultilevel, Parameters) {
    size_t ncells = 901;
    auto mock = mock_clusters(ncells, 13);

    scran_graph_cluster::ClusterMultilevelOptions opts;
    auto output1 = scran_graph_cluster::cluster_multilevel(mock.first, mock.second, opts);

    // Responds to changes.
    {
        scran_graph_cluster::ClusterMultilevelOptions opts;
        opts.resolution = 2;
        auto output2 = scran_graph_cluster::cluster_multilevel(mock.first, mock.second, opts);
        EXPECT_TRUE(compare_clusters(output1.membership, output2.membership));
    }

    // We can disable reporting.
    {
        scran_graph_cluster::ClusterMultilevelOptions opts;
        opts.report_levels = false;
        opts.report_modularity = false;
        auto output = scran_graph_cluster::cluster_multilevel(mock.first, mock.second, opts);
        EXPECT_EQ(output.modularity.size(), 0);
        EXPECT_EQ(output.levels.size(), 0);
    }

    // Seed gives reproducible results.
    {
        auto output2 = scran_graph_cluster::cluster_multilevel(mock.first, mock.second, opts);
        EXPECT_FALSE(compare_clusters(output1.membership, output2.membership));
    }
}

TEST(ClusterMultilevel, Sanity) {
    size_t ncells = 1212;
    size_t nclusters = 8;
    auto mock = mock_clusters(ncells, nclusters, 0.1, 0);

    scran_graph_cluster::ClusterMultilevelOptions opts;
    auto output = scran_graph_cluster::cluster_multilevel(mock.first, mock.second, opts);
    validate(output.membership, nclusters);
}

TEST(ClusterMultilevel, Unweighted) {
    auto mock = mock_clusters(899, 6);

    scran_graph_cluster::ClusterMultilevelResults output;
    scran_graph_cluster::ClusterMultilevelOptions opts;
    scran_graph_cluster::cluster_multilevel(mock.first.get(), NULL, opts, output);
    EXPECT_EQ(output.membership.size(), 899);
}
