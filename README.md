# Reproducible of pybind11 binding compile error

This project shows a Python binding that can be built with nanobind, 
but not with pybind11.


### To Start
```bash
git clone https://github.com/davidlatwe/py-binding-test.git
cd py-binding-test
git submodule update --init --recursive
```

### Build on Linux/macOS
```bash
CLEAN=1 NANOBIND=0 ./build.sh
```

### Build on Windows
```bash
./build.ps1 -clean 1 -nanobind 0
```
