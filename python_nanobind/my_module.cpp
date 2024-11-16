////
//// Sample code for nanobind
//// 2024-03-21: initial commit
////

#include <vector>

#include <nanobind/nanobind.h>
#include <nanobind/stl/vector.h>

namespace nb = nanobind;

double add(const double a, const double b) { return a + b; }

struct SampleStruct {
  int                 i_, j_;
  double              param_;
  std::vector<double> arr_;

  SampleStruct(const int& arr_size)
      : i_(arr_size),
        j_(2),
        param_(1.0),
        arr_(i_) {
    assert(i_ > 0);
    for (auto i = 0; i < arr_size; ++i) {
      arr_[i] = static_cast<double>(i);
    }
  }

  nb::dict get_info() {
    nb::dict info;
    info["array_size"]   = i_;
    info["int_param"]    = j_;
    info["double_param"] = param_;
    info["array"] = arr_;  // automatically converted to Python list object
    return info;
  }
};

NB_MODULE(my_module, m) {
  m.def("add", &add, nb::arg("a"), nb::arg("b"), "Explain of add()");

  nb::class_<SampleStruct>(m, "SampleStruct", "Explain Model")
      .def(nb::init<const int&>(), nb::arg("array_size") = 1, "Explain ctor")
      .def("get_info", &SampleStruct::get_info, "Explain get_info()");
}
