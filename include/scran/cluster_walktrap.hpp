#ifndef SCRAN_CLUSTER_WALKTRAP_HPP
#define SCRAN_CLUSTER_WALKTRAP_HPP

#include <vector>
#include <algorithm>

#include "raiigraph/raiigraph.hpp"
#include "igraph.h"

/**
 * @file cluster_walktrap.hpp
 * @brief Wrapper around **igraph**'s Walktrap community detection algorithm.
 */

namespace scran {

/**
 * @namespace scran::cluster_walktrap
 * @brief Wrapper around **igraph**'s Walktrap community detection algorithm.
 *
 * This applies Walktrap clustering on a graph to obtain communities of highly inter-connected nodes.
 * See [here](https://igraph.org/c/doc/igraph-Community.html#igraph_community_walktrap) for more details on the Walktrap algorithm. 
 */
namespace cluster_walktrap {

/**
 * @brief Options for `compute()`.
 */
struct Options {
    /**
     * Number of steps of the random walk.
     * The default is based on the example in the **igraph** documentation.
     */
    int steps = 4;
};

/**
 * @brief Result of the **igraph** Walktrap community detection algorithm.
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
     * Vector of length equal to the number of cells, containing 0-indexed cluster identities.
     */
    std::vector<Cluster_> membership;

    /**
     * Vector of length equal to the number of merge steps, containing the identities of the two clusters being merged.
     * Note that cluster IDs here are not the same as those in `membership`.
     */
    std::vector<std::pair<Cluster_, Cluster_> > merges;

    /**
     * Vector of length equal to `merges` plus 1, containing the modularity score before and after each merge step.
     * The maximum value is the modularity corresponding to the clustering in `membership`.
     */
    std::vector<Float_> modularity;
};

/**
 * Run the Walktrap community detection algorithm on a pre-constructed graph. 
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
template<typename Cluster_ = int, typename Float_ = double>
Results<Cluster_, Float_> compute(const igraph_t* graph, const igraph_vector_t* weights, Results<Cluster_, Float_>& output) {
    raiigraph::IntegerMatrix merges_holder;
    raiigraph::RealVector modularity_holder;
    raiigraph::IntegerVector membership_holder;

    auto modularity = modularity_holder.get();
    auto membership = membership_holder.get();
    auto merges = merges_holder.get();

    output.status = igraph_community_walktrap(graph, weights, steps, merges, modularity, membership);

    if (!output.status) {
        size_t nmods = igraph_vector_size(modularity);
        output.modularity.resize(nmods);
        for (size_t i = 0; i < nmods; ++i) {
            output.modularity[i] = VECTOR(*modularity)[i];
        }

        size_t nmerges = igraph_matrix_int_nrow(merges);
        output.merges.resize(nmerges);
        for (size_t i = 0; i < nmerges; ++i) {
            output.merges[i].first = MATRIX(*merges, i, 0);
            output.merges[i].second = MATRIX(*merges, i, 1);
        }

        size_t ncells = igraph_vcount(graph);
        output.membership.resize(ncells);
        for (size_t i = 0; i < ncells; ++i) {
            output.membership[i] = VECTOR(*membership)[i];
        }
    }
}

/**
 * Run the Walktrap community detection algorithm on a pre-constructed graph.
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

