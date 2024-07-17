#ifndef TEST_MOCK_CLUSTERS_H
#define TEST_MOCK_CLUSTERS_H

#include "raiigraph/raiigraph.hpp"
#include "igraph.h"

#include <random>
#include <vector>

inline std::pair<raiigraph::Graph, std::vector<igraph_real_t> > mock_clusters(size_t num_cells, size_t num_clusters, double in_connect = 0.1, double out_connect = 0.01) {
    std::vector<igraph_integer_t> edges;
    std::vector<igraph_real_t> weights;

    std::mt19937_64 rng(num_cells + num_clusters * 1000);
    std::uniform_real_distribution udist;

    for (size_t i = 0; i < num_cells; ++i) {
        auto clust = i % num_clusters;
        for (size_t j = 0; j < i; ++j) {
            auto connect = (j % num_clusters == clust ? in_connect : out_connect);
            if (udist(rng) < connect) {
                edges.push_back(i);
                edges.push_back(j);
                weights.push_back(udist(rng));
            }
        }
    }

    igraph_vector_int_t edge_view;
    igraph_vector_int_view(&edge_view, edges.data(), edges.size());
    return std::make_pair(raiigraph::Graph(&edge_view, num_cells, IGRAPH_UNDIRECTED), std::move(weights));
}

inline void check_multiple_clusters(const raiigraph::IntegerVector& clustering) {
    // Actually generates multiple clusters.
    bool has_multiple = false;
    size_t ncells = clustering.size();
    for (size_t i = 0; i < ncells; ++i) {
        if (clustering[i] > 0) {
            has_multiple = true;
            break;
        }
    }
    EXPECT_TRUE(has_multiple);
}

inline bool compare_clusters(const raiigraph::IntegerVector& clustering1, const raiigraph::IntegerVector& clustering2) {
    size_t ncells = clustering1.size();
    if (ncells != static_cast<size_t>(clustering2.size())) {
        return true;
    }

    for (size_t i = 0; i < ncells; ++i) {
        if (clustering1[i] != clustering2[i]) {
            return true;
        }
    }

    return false;
}

inline void validate(const raiigraph::IntegerVector& clustering, size_t nclusters) {
    // Each cluster should be of length > 1 and should only contain cells from the same modulo.
    std::map<int, std::vector<int> > by_clusters;
    size_t ncells = clustering.size();
    for (size_t c = 0; c < ncells; ++c) {
        by_clusters[clustering[c]].push_back(c);
    }

    ASSERT_TRUE(by_clusters.size() >= nclusters);
    for (const auto& clust : by_clusters) {
        ASSERT_TRUE(clust.second.size() > 1);

        int first_modulo = clust.second[0] % nclusters;
        for (auto c : clust.second) {
            ASSERT_EQ(c % nclusters, first_modulo);
        }
    }
}

#endif
