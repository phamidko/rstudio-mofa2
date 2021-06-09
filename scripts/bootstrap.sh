#!/bin/bash
set -e

echo "Running bootstrap ......................................................................."

# HTSlib 
# https://github.com/samtools/htslib
# By default, 'make install' installs HTSlib libraries under /usr/local/lib, HTSlib header files under /usr/local/include,
# utility programs under /usr/local/bin
# Also install libgsl-dev for GSL dependency
# libblas-dev liblapack-dev  -- BLAS/ LAPACK depende
echo "HTSlib .........................................................................."
apt-get update && apt-get install -y \
    autoconf \
    automake \
    make \
    gcc \
    curl \
    perl \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libcurl4-gnutls-dev \
    libssl-dev libgsl-dev \
    libblas-dev \
    liblapack-dev \
    && apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

git clone https://github.com/samtools/htslib.git
cd htslib
autoreconf -i 
git submodule update --init --recursive
./configure    # Optional but recommended, for choosing extra functionality
make
make install

# cmake bootstrap required to compile Eigen
# echo "cmake bootstrap from source .........................................................................."
# apt-get update && apt-get install -y build-essential 
# cd /tmp
# wget https://github.com/Kitware/CMake/releases/download/v3.20.3/cmake-3.20.3.tar.gz
# tar -zxf cmake-3.20.3.tar.gz
# cd cmake-3.20.3
# ./bootstrap
# make
# make install
# cmake --version

# # Update Eigen for RcppEigen dependency
# echo "Building Eigen Lib .........................................................................."
# cd /tmp
# wget https://gitlab.com/libeigen/eigen/-/archive/3.3.9/eigen-3.3.9.tar.gz
# tar -zxvf eigen-3.3.9.tar.gz
# cd eigen-3.3.9
# mkdir build
# cd /tmp/eigen-3.3.9/build
# cmake /tmp/eigen-3.3.9
# make install #  installing to /usr/local/include/eigen3



echo "Checking LD_LIBRARY_PATH : ${LD_LIBRARY_PATH} ......................................................"
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

echo "loading Ldconfig .........................................................................."
echo /usr/local/lib > /etc/ld.so.conf.d/usr_local_lib.conf
# ldconfig -v
ldconfig

#
# Add rstudio to sudo. Fix Premission /usr/local/lib/R
#
usermod -aG sudo rstudio
chown -R rstudio:rstudio /usr/local/lib/R