#!/bin/bash

cd /pulsar/pulsar-client-cpp

find . -name CMakeCache.txt | xargs rm
find . -name CMakeFiles | xargs rm -rf

cmake . -DPYTHON_INCLUDE_DIR=/opt/python/cp27-cp27mu/include/python2.7 \
        -DPYTHON_LIBRARY=/opt/python/cp27-cp27mu/lib

make -j16
make

cd python
python setup.py bdist_wheel
auditwheel dist/*.whl

twine upload wheelhouse/*.whl
