include(FetchContent)

FetchContent_Declare(
  knncolle
  GIT_REPOSITORY https://github.com/knncolle/knncolle
  GIT_TAG master # ^3.0.0
)

FetchContent_Declare(
  raiigraph
  GIT_REPOSITORY https://github.com/LTLA/raiigraph
  GIT_TAG master # ^1.1.0
)

FetchContent_MakeAvailable(knncolle)
FetchContent_MakeAvailable(raiigraph)

