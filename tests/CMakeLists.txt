include(FetchContent)
FetchContent_Declare(
  scran_tests
  GIT_REPOSITORY https://github.com/libscran/test_utils
  GIT_TAG master
)
FetchContent_MakeAvailable(scran_tests)

enable_testing()

add_executable(
    libtest 
    src/build_snn_graph.cpp
    src/cluster_multilevel.cpp
    src/cluster_walktrap.cpp
    src/cluster_leiden.cpp
    src/edges_to_graph.cpp
)

target_link_libraries(
    libtest
    scran_graph_cluster
    scran_tests
)

target_compile_options(libtest PRIVATE -Wall -Wpedantic -Wextra)

option(CODE_COVERAGE "Enable coverage testing" OFF)
if(CODE_COVERAGE AND CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    target_compile_options(libtest PRIVATE -O0 -g --coverage)
    target_link_options(libtest PRIVATE --coverage)
endif()

include(GoogleTest)
gtest_discover_tests(libtest)
