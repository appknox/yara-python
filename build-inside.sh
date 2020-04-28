#!/bin/bash
set -e -x
cd /io
export CFLAGS='-std=gnu99'

pybins=(
    "/opt/python/cp36-cp36m/bin" 
    "/opt/python/cp37-cp37m/bin" 
    "/opt/python/cp38-cp38/bin"
)


for PYBIN in "${pybins[@]}"; do
    "${PYBIN}/python" setup.py build --enable-dotnet --enable-dex --enable-macho
    "${PYBIN}/python" setup.py bdist_wheel
done

mv dist/ preauditdist/

# Bundle external shared libraries into the wheels
for whl in preauditdist/*.whl; do
    auditwheel repair "$whl" --plat manylinux1_x86_64 -w /io/dist/
done

rm -rf preauditdist/