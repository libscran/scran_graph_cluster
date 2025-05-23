cmake_minimum_required(VERSION 3.14)

project(scran_graph_cluster
    VERSION 0.2.0
    DESCRIPTION "Cluster cells using graph-based methods"
    LANGUAGES CXX)

include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

# Library
add_library(scran_graph_cluster INTERFACE)
add_library(libscran::scran_graph_cluster ALIAS scran_graph_cluster)

target_include_directories(scran_graph_cluster INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/scran_graph_cluster>)
target_compile_features(scran_graph_cluster INTERFACE cxx_std_17)

# Dependencies
option(SCRAN_GRAPH_CLUSTER_FETCH_EXTERN "Automatically fetch scran_graph_cluster's external dependencies (except for igraph)." ON)
if(SCRAN_GRAPH_CLUSTER_FETCH_EXTERN)
    add_subdirectory(extern)
else()
    find_package(ltla_raiigraph 1.1.0 CONFIG REQUIRED)
    find_package(knncolle_knncolle 3.0.0 CONFIG REQUIRED)
endif()

target_link_libraries(scran_graph_cluster INTERFACE ltla::raiigraph knncolle::knncolle)

option(SCRAN_GRAPH_CLUSTER_FIND_IGRAPH "Search for the igraph package." ON)
if(SCRAN_GRAPH_CLUSTER_FIND_IGRAPH)
    find_package(igraph 0.10.0 CONFIG)
    if (igraph_FOUND)
        target_link_libraries(scran_graph_cluster INTERFACE igraph::igraph)
    endif()
endif()

# Tests
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    option(SCRAN_GRAPH_CLUSTER_TESTS "Build scran_graph_cluster's test suite." ON)
else()
    option(SCRAN_GRAPH_CLUSTER_TESTS "Build scran_graph_cluster's test suite." OFF)
endif()

if(SCRAN_GRAPH_CLUSTER_TESTS)
    include(CTest)
    if(BUILD_TESTING)
        add_subdirectory(tests)
    endif() 
endif()

# Install
install(DIRECTORY include/
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/scran_graph_cluster)

install(TARGETS scran_graph_cluster
    EXPORT scran_graph_clusterTargets)

install(EXPORT scran_graph_clusterTargets
    FILE libscran_scran_graph_clusterTargets.cmake
    NAMESPACE libscran::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/libscran_scran_graph_cluster)

configure_package_config_file(${CMAKE_CURRENT_SOURCE_DIR}/cmake/Config.cmake.in
    "${CMAKE_CURRENT_BINARY_DIR}/libscran_scran_graph_clusterConfig.cmake"
    INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/libscran_scran_graph_cluster)

write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/libscran_scran_graph_clusterConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion)

install(FILES "${CMAKE_CURRENT_BINARY_DIR}/libscran_scran_graph_clusterConfig.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/libscran_scran_graph_clusterConfigVersion.cmake"
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/libscran_scran_graph_cluster)
