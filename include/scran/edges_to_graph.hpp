#ifndef SCRAN_EDGES_TO_GRAPH_HPP
#define SCRAN_EDGES_TO_GRAPH_HPP

#include "raiigraph/raiigraph.hpp"

/**
 * @file edges_to_graph.hpp
 * @brief Convert a list of edges to a graph.
 */
namespace scran {

/**
 * @namespace scran::edges_to_graph
 * @brief Convert a list of edges to a graph.
 */
namespace edges_to_graph {

/**
 * Create an `raiigraph:Graph` object from the edges.
 *
 * @tparam Vertex_ Integer type for the vertex IDs.
 *
 * @param double_edges The number of edges times two.
 * @param[in] edges Pointer to an array of length `double_edges`.
 * `edges[2*i]` and `edges[2*i+1]` define the vertices for edge `i`.
 * For directed graphs, the edge goes from the first vertex to the second vertex.
 * @param num_vertices Number of vertices in the graph.
 * @param directed Whether the graph is directed.
 * This should be one of `IGRAPH_DIRECTED` or `IGRAPH_UNDIRECTED`.
 *
 * @return A graph created from `edges`.
 */
template<typename Vertex_>
raiigraph::Graph compute(size_t double_edges, const Vertex_* edges, size_t num_vertices, igraph_bool_t directed) {
    if constexpr(std::is_same<Vertex_, igraph_integer_t>::value) {
        igraph_vector_int_t edge_view;
        igraph_vector_int_view(&edge_view, edges, double_edges);
        return igraph::Graph(&edge_view, num_vertices, directed);
    } else {
        raiigraph::IntegerVector tmp(double_edges);
        for (size_t x = 0; x < double_edges; ++x) {
            VECTOR(tmp)[x] = edges[x];
        }
        return igraph::Graph(edges, num_vertices, directed);
    }
}

}

}

#endif
