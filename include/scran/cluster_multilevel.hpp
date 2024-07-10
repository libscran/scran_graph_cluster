#ifndef SCRAN_CLUSTER_MULTILEVEL_HPP
#define SCRAN_CLUSTER_MULTILEVEL_HPP

#include <vector>
#include <algorithm>

#include "raiigraph/raiigraph.hpp"
#include "igraph.h"

/**
 * @file cluster_multilevel.hpp
 * @brief Wrapper around **igraph**'s multi-level community detection algorithm.
 */

namespace scran {

/**
 * @namespace scran::cluster_multilevel
 * @brief Wrapper around **igraph**'s multi-level community detection algorithm.
 *
 * This applies multi-level (i.e., "Louvain") clustering on a graph to obtain communities of highly inter-connected nodes.
 * See [here](https://igraph.org/c/doc/igraph-Community.html#igraph_community_multilevel) for more details on the multi-level algorithm. 
 */
namespace cluster_multilevel {

/**
 * @brief Options for `compute()`.
 */
struct Options {
    /**
     * Resolution of the clustering, must be non-negative.
     * Lower values favor fewer, larger communities; higher values favor more, smaller communities.
     */
    double resolution = 1;

    /**
     * Seed for the **igraph** random number generator.
     */
    int seed = 42;
};

/**
 * @brief Result of the **igraph** multi-level community detection algorithm.
 *
 * A separate set of clustering results is reported for each level.
 * The level with the highest modularity of its clusters is also determined;
 * this clustering is usually a good default choice for downstream analysis.
 *
 * @tparam Cluster_ Integer type for cluster assignments.
 * @tparam Float_ Floating-point type for the modularity.
 */
template<typename Cluster_ = int, typename Float_ = double>
struct Results {
    /** 
     * Output status.
     * A value of zero indicates that the algorithm completed successfully.
     */
    int status = 0;
    
    /**
     * The level that maximizes the modularity.
     * This can be used to index a particular result in `membership` and `modularity`.
     */
    size_t max = 0;

    /**
     * Each vector contains the clustering result for a particular level.
     * Each vector is of length equal to the number of cells and contains 0-indexed cluster identities.
     */
    std::vector<std::vector<Cluster_> > membership;

    /**
     * Modularity scores at each level.
     * This is of the same length as `membership`.
     */
    std::vector<Float_> modularity;
};

/**
 * Run the multi-level community detection algorithm on a pre-constructed graph.
 *
 * @tparam Cluster_ Integer type for cluster assignments.
 * @tparam Float_ Floating-point type for the modularity.
 *
 * @param graph An existing graph.
 * @param weights Pointer to an array of weights of length equal to the number of edges in `graph`. 
 * This should be in the same order as the edge list in `graph`.
 * @param options Further options.
 * @param[out] output On output, this is filtered with the clustering results.
 * The input value is ignored, so this object can be re-used across multiple calls to `compute()`.
 */
template<typename Cluster_, typename Float_>
void compute(const igraph_t* graph, const igraph_vector_t* weights, const Options& options, Results<Cluster_, Float_>& output) {
    raiigraph::IntegerVector membership_holder;
    raiigraph::RealVector modularity_holder;
    raiigraph::IntegerMatrix memberships_holder;
    raiigraph::RNGScope rngs(options.seed);

    auto modularity = modularity_holder.get();
    auto membership = membership_holder.get();
    auto memberships = memberships_holder.get();

    output.status = igraph_community_multilevel(
        graph,
        weights,
        options.resolution,
        membership,
        memberships, 
        modularity
    );

    if (!output.status) {
        output.max = igraph_vector_which_max(modularity);

        size_t nmods = igraph_vector_size(modularity);
        output.modularity.resize(nmods);
        for (size_t i = 0; i < nmods; ++i) {
            output.modularity[i] = VECTOR(*modularity)[i];
        }

        size_t ncells = igraph_vcount(graph);
        size_t nlevels = igraph_matrix_int_nrow(memberships);
        output.membership.resize(nlevels);
        
        for (size_t i = 0; i < nlevels; ++i) {
            auto& current = output.membership[i];
            current.resize(ncells);
            for (size_t j = 0; j < ncells; ++j) {
                current[j] = MATRIX(*memberships, i, j);
            }
        }
    }

    return output;
}

/**
 * Run the multi-level community detection algorithm on a pre-constructed graph.
 *
 * @tparam Cluster_ Integer type for cluster assignments.
 * @tparam Float_ Floating-point type for the modularity.
 *
 * @param graph An existing graph.
 * @param weights Vector of weights of length equal to the number of edges in `graph`. 
 * This should be in the same order as the edge list in `graph`.
 * @param options Further options.
 *
 * @return Clustering results for the nodes of the graph.
 */
template<typename Cluster_ = int, typename Float_ = double>
Results<Cluster_, Float_> compute(const raiigraph::Graph& graph, const std::vector<igraph_real_t>& weights, const Options& options) {
    // No need to free this, as it's just a view.
    igraph_vector_t weight_view;
    igraph_vector_view(&weight_view, weights.data(), weights.size());

    Results<Cluster_, Float_> output;
    compute(graph.get(), &weight_view, options, output);
    return output;
}

}

}

#endif

