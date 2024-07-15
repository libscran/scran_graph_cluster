#include "gtest/gtest.h"

#include "scran_graph_cluster/edges_to_graph.hpp"
#include "igraph.h"

#include <vector>

TEST(EdgesToGraph, Basic) {
    std::vector<igraph_integer_t> stuff{ 0, 1, 3, 4, 8, 9 };
    auto out = scran_graph_cluster::edges_to_graph(stuff.size(), stuff.data(), 10, IGRAPH_UNDIRECTED);

    EXPECT_FALSE(out.is_directed());
    EXPECT_EQ(out.vcount(), 10);
    EXPECT_EQ(out.ecount(), 3);

    // Works for other types.
    std::vector<unsigned char> cstuff(stuff.begin(), stuff.end());
    auto cout = scran_graph_cluster::edges_to_graph(cstuff.size(), cstuff.data(), 10, IGRAPH_DIRECTED);

    EXPECT_TRUE(cout.is_directed());
    EXPECT_EQ(cout.vcount(), 10);
    EXPECT_EQ(cout.ecount(), 3);
}
