# build environment
FROM ubuntu:20.04 as ubuntu

# install gcc, openSSL, git
RUN apt-get -y update
RUN apt-get -y install wget
RUN apt-get -y install git
RUN apt-get -y install build-essential
RUN apt-get -y install libssl-dev


# install cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.19.0/cmake-3.19.0-Linux-x86_64.tar.gz
RUN tar -xzf cmake*.tar.gz 
RUN mv cmake*/ cmake/

# install tbb
RUN git clone https://github.com/wjakob/tbb.git
WORKDIR /tbb/build
RUN git checkout 141b0e310e1fb552bdca887542c9c1a8544d6503
RUN ../../cmake/bin/cmake ..
RUN make
RUN make install
WORKDIR /opt


# compile PotreeConverter
RUN git clone https://github.com/potree/PotreeConverter.git
RUN mkdir /opt/PotreeConverter/build
WORKDIR /opt/PotreeConverter/build
RUN git checkout da93ec26411b82ffbf799daf5ac56608ef988bf8
RUN ../../../cmake/bin/cmake ..
RUN make

# copy libtbb.so in PotreeConverter build
RUN cp /tbb/build/libtbb.so /opt/PotreeConverter/build/libtbb.so


WORKDIR /opt/PotreeConverter/build

