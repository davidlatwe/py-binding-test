cmake_minimum_required(VERSION 3.4)
project(
    PythonBindingTest
    VERSION 0.1.0
    LANGUAGES CXX
    DESCRIPTION "Python binding test"
)

find_package(Python 3.10 COMPONENTS Development.Module REQUIRED)

set(SRC
    src/library.cpp
    src/binding.cpp
)
if (USE_NANOBIND)
    # nanobind
    add_subdirectory(external/nanobind EXCLUDE_FROM_ALL)
    nanobind_add_module(example ${SRC})
    target_compile_definitions(example PRIVATE -DUSE_NANOBIND)
else ()
    # pybind11
    add_subdirectory(external/pybind11 EXCLUDE_FROM_ALL)
    pybind11_add_module(example ${SRC})
endif ()
