

### Build statically linked Pulsar client Python package for Linux

In order to build a Python wheel file for the Pulsar client
suitable to be uploaded to PyPI, we need to make sure
to statically link all the required shared libraries.

In addition to that, we need to compile on Centos5.5,
so that we can use the `manylinux1` OS target and the wheel file
will be portable across Linux distributions and accepted
on PyPI


Create the build image, that comes with the dependencies compiled

```shell
docker build -t pulsar-build:manylinux -f Dockerfile.manylinux .
```

Attach Pulsar sources as volume on `/pulsar` and run the build

```
docker run -it -v ~/pulsar:/pulsar pulsar-build:manylinux /build.sh
```
