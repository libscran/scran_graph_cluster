include(FetchContent)

if (SCRAN_MARKERS_FETCH_EXTERN_IGRAPH)
    FetchContent_Declare(
      igraph
      GIT_REPOSITORY https://github.com/igraph/igraph
      GIT_TAG master # ^0.10.0
    )
endif()

FetchContent_Declare(
  knncolle
  GIT_REPOSITORY https://github.com/knncolle/knncolle
  GIT_TAG master # ^2.0.0
)

FetchContent_Declare(
  igraph-cpp
  GIT_REPOSITORY https://github.com/LTLA/igraph-cpp
  GIT_TAG main # ^1.0.0
)

FetchContent_MakeAvailable(knncolle)

if (SCRAN_MARKERS_FETCH_EXTERN_IGRAPH)
    FetchContent_MakeAvailable(igraph)
endif()

FetchContent_MakeAvailable(igraph-cpp)
