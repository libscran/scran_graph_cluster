cmake_minimum_required(VERSION 3.14)

project(scran_snn_clustering
    VERSION 1.0.0
    DESCRIPTION "Build a shared nearest neighbor graph across cells"
    LANGUAGES CXX)

add_library(scran_snn_clustering INTERFACE)
target_compile_features(scran_snn_clustering INTERFACE cxx_std_17)
target_include_directories(scran_snn_clustering INTERFACE include/scran)

add_subdirectory(extern)
target_link_libraries(scran_snn_clustering INTERFACE knncolle::knncolle ltla::raiigraph)

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    include(CTest)
    if(BUILD_TESTING)
        add_subdirectory(tests)
    endif()
endif()
