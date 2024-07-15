cmake_minimum_required(VERSION 3.14)

project(scran_graph_cluster
    VERSION 1.0.0
    DESCRIPTION "Cluster cells using graph-based methods"
    LANGUAGES CXX)

# Library
add_library(scran_graph_cluster INTERFACE)
add_library(libscran::scran_graph_cluster ALIAS scran_graph_cluster)

target_include_directories(scran_graph_cluster INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/scran_graph_cluster>)
target_compile_features(scran_graph_cluster INTERFACE cxx_std_17)

# Dependencies
option(SCRAN_MARKERS_FETCH_EXTERN "Automatically fetch scran_graph_cluster's external dependencies (except for igraph)." ON)
option(SCRAN_MARKERS_FETCH_EXTERN_IGRAPH "Automatically fetch scran_graph_cluster's external igraph dependency." OFF)

if (NOT SCRAN_MARKERS_FETCH_EXTERN_IGRAPH)
    # igraph needs compilation so we just try to get it from the system by
    # default, rather than pulling it down and building the whole thing.
    find_package(igraph 0.10.0 CONFIG REQUIRED)
endif()

if(SCRAN_MARKERS_FETCH_EXTERN)
    add_subdirectory(extern)
else()
    find_package(ltla_raiigraph 1.0.0 CONFIG REQUIRED)
    find_package(knncolle_knncolle 2.0.0 CONFIG REQUIRED)
endif()

target_link_libraries(scran_graph_cluster INTERFACE igraph::igraph igraph:igraph-cpp knncolle::knncolle)

# Tests
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    option(SCRAN_MARKERS_TESTS "Build scran_graph_cluster's test suite." ON)
else()
    option(SCRAN_MARKERS_TESTS "Build scran_graph_cluster's test suite." OFF)
endif()

if(SCRAN_MARKERS_TESTS)
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
