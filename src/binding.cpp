#include "library.h"

#ifdef USE_NANOBIND
#   include <nanobind/nanobind.h>
#   define ADD_MODULE NB_MODULE
    namespace py = nanobind;
#else
#   include <pybind11/pybind11.h>
#   define ADD_MODULE PYBIND11_MODULE
    namespace py = pybind11;
#endif


ADD_MODULE(example, m /*'m' for module*/) {
    m.def("GetContext", GetContext);
}
