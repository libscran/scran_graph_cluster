# Graph-based clustering for single-cell data

![Unit tests](https://github.com/libscran/scran_graph_cluster/actions/workflows/run-tests.yaml/badge.svg)
![Documentation](https://github.com/libscran/scran_graph_cluster/actions/workflows/doxygenate.yaml/badge.svg)
[![Codecov](https://codecov.io/gh/libscran/scran_graph_cluster/graph/badge.svg?token=qklLZtJSE9)](https://codecov.io/gh/libscran/scran_graph_cluster)

## Overview

This repository implements functions for construction and clustering of a nearest-neighbor graph created from single-cell data.
Each node in the graph is a cell where edges are formed between neighboring cells in expression space, thus allowing us to identify communities of closely-related cells.
The code itself was originally derived from the [**scran**](https://bioconductor.org/packages/scran) R package,
been factored out into a separate C++ library for easier re-use.

## Quick start

Given a column-major array of cell coordinates (typically in some [low-dimensional space](https://github.com/libscran/scran_pca)),
we can construct a shared nearest-neighbor (SNN) graph from each cell's list of neighbors:

```cpp
#include "scran_graph_cluster/scran_graph_cluster.hpp"

size_t ncells = 1000;
size_t ndims = 100;
std::vector<double> coordinates(ndims * ncells);
// Fill it with some coordinates as a column-major array of ndims * nobs.

// Configuring the neighbor search algorithm; here, we'll be using an exact
// search based on VP trees with a Euclidean distance metric.
knncolle::VptreeBuilder<int, double, double> vp_builder(
    std::make_shared<knncolle::EuclideanDistance<double, double> >()
);

auto built = scran_graph_cluster::build_snn_graph(
    ndims,
    ncells,
    coordinates.data(),
    vp_builder,
    scran_graph_cluster::BuildSnnGraphOptions()
);

auto graph = scran_graph_cluster::convert_to_graph(built);
const auto& weights = built.weights; // edge weights
```

We perform community detection via some convenience wrappers around the [**igraph**](https://igraph.org) library:

```cpp
scran_graph_cluster::ClusterMultilevelOptions mlopt;
auto mlres = scran_graph_cluster::cluster_multilevel(graph, weights, mlopt);
mlres.membership; // cluster assignments for each cell.

scran_graph_cluster::ClusterWalktrapOptions wkopt;
auto mlres = scran_graph_cluster::cluster_walktrap(graph, weights, wkopt);
wkres.membership; // cluster assignments for each cell.
```

Check out the [reference documentation](https://libscran.github.io/scran_graph_cluster) for more details.

## Building projects

### CMake with `FetchContent`

If you're using CMake, you just need to add something like this to your `CMakeLists.txt`:

```cmake
include(FetchContent)

FetchContent_Declare(
  scran_graph_cluster
  GIT_REPOSITORY https://github.com/libscran/scran_graph_cluster
  GIT_TAG master # replace with a pinned release
)

FetchContent_MakeAvailable(scran_graph_cluster)
```

Then you can link to **scran_graph_cluster** to make the headers available during compilation:

```cmake
# For executables:
target_link_libraries(myexe libscran::scran_graph_cluster)

# For libaries
target_link_libraries(mylib INTERFACE libscran::scran_graph_cluster)
```

This will fetch all external dependencies except for [**igraph**](https://igraph.org), which should already be installed and available via `find_package()`.
Users can set the `SCRAN_GRAPH_CLUSTER_FIND_IGRAPH` option to disable **igraph** discovery (e.g., to supply a custom **igraph** installation),
in which case they will need to link to **igraph** manually in their `target_link_libraries()` call.
Users are also advised to pin the versions of all dependencies - see [`extern/CMakeLists.txt`](extern/CMakeLists.txt) for suggested versions.
If you want to install each dependency, use `-DSCRAN_GRAPH_CLUSTER_FETCH_EXTERN=OFF`.

### CMake with `find_package()`

```cmake
find_package(libscran_scran_graph_cluster CONFIG REQUIRED)
target_link_libraries(mylib INTERFACE libscran::scran_graph_cluster)
```

To install the library, use:

```sh
mkdir build && cd build
cmake .. -DSCRAN_GRAPH_CLUSTER_TESTS=OFF
cmake --build . --target install
```

Again, this will use `FetchContent` to fetch all external dependencies except for **igraph**, see comments above.

### Manual

If you're not using CMake, the simple approach is to just copy the files in `include/` - either directly or with Git submodules - and include their path during compilation with, e.g., GCC's `-I`.
This requires the external dependencies listed in [`extern/CMakeLists.txt`](extern/CMakeLists.txt) as well as the **igraph** library.
