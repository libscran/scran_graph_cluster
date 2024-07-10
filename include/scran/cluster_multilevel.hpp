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

    /**
     * Whether to report the multi-level clusterings in `Results::memberships`.
     */
    bool report_levels = true;

    /**
     * Whether to report the modularity for each level in `Results::modularity`.
     */
    bool report_modularity = true;
};

/**
 * @brief Result of the **igraph** multi-level community detection algorithm.
 */
struct Results {
    /** 
     * Output status.
     * A value of zero indicates that the algorithm completed successfully.
     */
    int status = 0;

    /**
     * Vector of length equal to the number of cells, containing 0-indexed cluster identities.
     * This is the same as the row of `levels` with the maximum `modularity`.
     */
    raiigraph::IntegerVector membership;

    /**
     * Matrix of clusterings for each level.
     * Each row corresponds to a level and contains 0-indexed cluster identities for all cells (columns).
     * This should only be used if `Options::report_levels = true`.
     */
    raiigraph::IntegerMatrix levels;

    /**
     * Modularity scores at each level.
     * This is of the same length as the number of rows in `levels`.
     * It should only be used if `Options::report_modularity = true`.
     */
    raiigraph::RealVector modularity;
};

/**
 * Run the multi-level community detection algorithm on a pre-constructed graph.
 *
 * @param graph An existing graph.
 * @param weights Pointer to an array of weights of length equal to the number of edges in `graph`. 
 * This should be in the same order as the edge list in `graph`.
 * @param options Further options.
 * @param[out] output On output, this is filtered with the clustering results.
 * The input value is ignored, so this object can be re-used across multiple calls to `compute()`.
 */
inline void compute(const igraph_t* graph, const igraph_vector_t* weights, const Options& options, Results& output) {
    raiigraph::RNGScope rngs(options.seed);

    auto modularity = (options.report_modularity ? output.modularity.get() : NULL);
    auto membership = output.membership.get();
    auto memberships = (options.report_levels ? output.levels.get() : NULL);

    output.status = igraph_community_multilevel(
        graph,
        weights,
        options.resolution,
        membership,
        memberships, 
        modularity
    );
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
inline Results compute(const raiigraph::Graph& graph, const std::vector<igraph_real_t>& weights, const Options& options) {
    // No need to free this, as it's just a view.
    igraph_vector_t weight_view;
    igraph_vector_view(&weight_view, weights.data(), weights.size());

    Results output;
    compute(graph.get(), &weight_view, options, output);
    return output;
}

}

}

#endif

