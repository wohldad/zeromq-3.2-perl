# zeromq-3.2-perl

This is a collection of ZeroMQ scripts to show possible use cases.

## Install

### Download zeromq

    cd /usr/local/src
    sudo wget https://github.com/zeromq/zeromq3-x/releases/download/v3.2.5/zeromq-3.2.5.tar.gz
    sudo mkdir zeromq-3.2.5
    sudo chown username:group zeromq-3.2.5
    tar -zxvf zeromq-3.2.5.tar.gz
    cd zeromq-3.2.5
    ./configure
    make
    make check
    sudo make install
    sudo ldconfig

### Check installed

    ldconfig -p | grep zmq

### Expected

    libzmq.so.5 (libc6,x86-64) => /usr/local/lib/libzmq.so.5
    libzmq.so (libc6,x86-64) => /usr/local/lib/libzmq.so

### Install Perl Modules

    sudo cpan install ZMQ::FFI
