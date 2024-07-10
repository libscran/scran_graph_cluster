#ifndef SCRAN_CLUSTER_LEIDEN_HPP
#define SCRAN_CLUSTER_LEIDEN_HPP

#include <vector>
#include <algorithm>

#include "raiigraph/raiigraph.hpp"
#include "igraph.h"

/**
 * @file cluster_leiden.hpp
 * @brief Wrapper around **igraph**'s Leiden community detection algorithm.
 */

namespace scran {

/**
 * @brief Wrapper around **igraph**'s Leiden community detection algorithm.
 *
 * This applies Leiden clustering on a graph to obtain communities of highly inter-connected nodes.
 * See [here](https://igraph.org/c/doc/igraph-Community.html#igraph_community_leiden) for more details on the Leiden algorithm. 
 */
namespace cluster_leiden {

/**
 * @brief Options for `compute()`.
 */
struct Options {
    /**
     * Resolution of the clustering.
     * Larger values result in more fine-grained communities.
     * The default is based on `?cluster_leiden` in the **igraph** R package.
     */
    double resolution = 1;

    /**
     * Level of randomness used during refinement.
     * The default is based on `?cluster_leiden` in the **igraph** R package.
     */
    double beta = 0.01;

    /**
     * Number of iterations of the Leiden algorithm.
     * More iterations can improve separation at the cost of computational time.
     * The default is based on `?cluster_leiden` in the **igraph** R package.
     */
    int iterations = 2;

    /**
     * Whether to optimize the modularity instead of the Constant Potts Model.
     * The two are closely related but the magnitude of the resolution is different.
     * The default is based on `?cluster_leiden` in the **igraph** R package.
     */
    bool modularity = false;

    /**
     * Whether to report the quality of the clustering in `Results::quality`.
     */
    bool report_quality = false;

    /**
     * Seed for the **igraph** random number generator.
     */
    int seed = 42;
};

/**
 * @brief Result of the **igraph** leiden community detection algorithm.
 */
struct Results {
    /** 
     * Output status.
     * A value of zero indicates that the algorithm completed successfully.
     */
    int status = 0;
    
    /**
     * Vector of length equal to the number of cells, containing 0-indexed cluster identities.
     */
    raiigraph::IntegerVector membership;

    /**
     * Quality of the clustering, closely related to the modularity.
     * This is only defined if `Options::report_quality = true`.
     */
    igraph_real_t quality = 0;
};

/**
 * Run the Leiden community detection algorithm on a pre-constructed graph. 
 *
 * @param graph An existing graph.
 * @param weights Pointer to an array of weights of length equal to the number of edges in `graph`. 
 * This should be in the same order as the edge list in `graph`.
 * @param options Further options.
 * @param[out] output On output, this is filtered with the clustering results.
 * The input value is ignored, so this object can be re-used across multiple calls to `compute()`.
 */
inline void compute(const igraph_t* graph, const igraph_vector_t* weights, const Options& options, Results& output) {
    auto membership = output.membership.get();
    auto& quality = (options.report_quality ? &(output.quality) : NULL);

    igraph::RNGScope rngs(options.seed);

    if (!modularity) {
        output.status = igraph_community_leiden(
            graph, 
            weights,
            NULL,
            options.resolution, 
            options.beta,
            false, 
            options.iterations, 
            membership, 
            NULL,
            quality
        );

    } else {
        // More-or-less translated from igraph::cluster_leiden in the R package.
        igraph::RealVector strength_holder(igraph_vcount(graph));
        auto strength = strength_holder.get();
        igraph_strength(graph, strength, igraph_vss_all(), IGRAPH_ALL, 1, weights);

        double total_weights = std::accumulate(weights, weights + nedges, 0.0);
        double mod_resolution = options.resolution / total_weights;

        output.status = igraph_community_leiden(
            graph, 
            weight, 
            strength, 
            mod_resolution, 
            options.beta, 
            false, 
            options.iterations, 
            membership, 
            NULL, 
            quality
        );
    }
}

/**
 * Run the Leiden community detection algorithm on a pre-constructed graph.
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

    Results<Cluster_, Float_> output;
    compute(graph.get(), &weight_view, options, output);
    return output;
}

}

}

#endif
