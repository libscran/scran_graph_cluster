include(FetchContent)
FetchContent_Declare(
  scran_tests
  GIT_REPOSITORY https://github.com/libscran/test_utils
  GIT_TAG master
)
FetchContent_MakeAvailable(scran_tests)

enable_testing()

option(CODE_COVERAGE "Enable coverage testing" OFF)
set(DO_CODE_COVERAGE OFF)
if(CODE_COVERAGE AND CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    set(DO_CODE_COVERAGE ON)
endif()

include(GoogleTest)

macro(create_test name) 
    add_executable(
        ${name} 
        src/build_snn_graph.cpp
        src/cluster_multilevel.cpp
        src/cluster_walktrap.cpp
        src/cluster_leiden.cpp
        src/edges_to_graph.cpp
    )

    target_link_libraries(
        ${name}
        scran_graph_cluster
        scran_tests
    )

    target_compile_options(${name} PRIVATE -Wall -Wpedantic -Wextra)

    if(DO_CODE_COVERAGE)
        target_compile_options(${name} PRIVATE -O0 -g --coverage)
        target_link_options(${name} PRIVATE --coverage)
    endif()

    gtest_discover_tests(${name})
endmacro()

create_test(libtest)

find_package(OpenMP)
if (USE_OPENMP)
    create_test(omptest)
    target_link_libraries(omptest OpenMP::OpenMP_CXX)
endif()
