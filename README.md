# Graph-based clustering

![Unit tests](https://github.com/libscran/snn_clustering/actions/workflows/run-tests.yaml/badge.svg)
![Documentation](https://github.com/libscran/snn_clustering/actions/workflows/doxygenate.yaml/badge.svg)
[![Codecov](https://codecov.io/gh/libscran/snn_clustering/graph/badge.svg?token=qklLZtJSE9)](https://codecov.io/gh/libscran/snn_clustering)

## Overview

This repository implements functions for construction and clustering of a nearest-neighbor graph created from single-cell data.
Each node in the graph is a cell where edges are formed between neighboring cells in expression space, thus allowing us to identify communities of closely-related cells.
The code itself was originally derived from the [**scran**](https://bioconductor.org/packages/scran) R package,
been factored out into a separate C++ library for easier re-use.

## Quick start

Given a column-major array of cell coordinates (typically in some [low-dimensional space](https://github.com/libscran/principal_component_analysis)),
we can construct a shared-nearest-neighbor graph:

```cpp
#include "scran/build_snn_graph.hpp"

size_t ncells = 1000;
size_t ndims = 100;
std::vector<double> coordinates(ndims * ncells);
// Fill it with some coordinates...

auto built = scran::build_snn_graph::compute(
    ndims,
    ncells,
    coordinates.data(),
    knncolle::VptreeBuilder<>(),
    scran::build_snn_graph::Options()
);

const auto& graph = scran::build_snn_graph::convert_to_graph(built);
const auto& weights = built.weights; // edge weights
```

We can perform community detection via some convenience wrappers around the [**igraph**](https://igraph.org) C library functions:

```cpp
#include "scran/cluster_multilevel.hpp"

scran::cluster_multilevel::Options mlopt;
auto mlres = scran::cluster_multilevel::compute(graph, weights, mlopt);
mlres.membership; // cluster assignments for each cell.

scran::cluster_walktrap::Options wkopt;
auto mlres = scran::cluster_walktrap::compute(graph, weights, wkopt);
wkres.membership; // cluster assignments for each cell.
```

Check out the [reference documentation](https://libscran.github.io/snn_clustering) for more details.

## Building projects

This repository is part of the broader [**libscran**](https://github.com/libscran/libscran) library,
so users are recommended to use the latter in their projects.
**libscran** developers should just use CMake with `FetchContent`:

```cmake
include(FetchContent)

FetchContent_Declare(
  scran_snn_clustering 
  GIT_REPOSITORY https://github.com/libscran/snn_clustering
  GIT_TAG master # or any version of interest
)

FetchContent_MakeAvailable(scran_snn_clustering)

# For executables:
target_link_libraries(myexe scran_snn_clustering)

# For libaries
target_link_libraries(mylib INTERFACE scran_snn_clustering)
```
