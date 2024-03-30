cmake_minimum_required(VERSION 3.15)
project(
    PythonBindingTest
    VERSION 0.1.0
    LANGUAGES CXX
    DESCRIPTION "Python binding test"
)

set(SRC
    src/library.cpp
    src/binding.cpp
)
if (USE_NANOBIND)
    # nanobind
    find_package(Python 3.8 COMPONENTS Interpreter Development.Module REQUIRED)
    add_subdirectory(external/nanobind EXCLUDE_FROM_ALL)
    nanobind_add_module(example ${SRC})
    target_compile_definitions(example PRIVATE -DUSE_NANOBIND)
else ()
    # pybind11
    add_subdirectory(external/pybind11 EXCLUDE_FROM_ALL)
    pybind11_add_module(example ${SRC})
endif ()
