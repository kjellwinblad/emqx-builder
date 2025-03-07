FROM balenalib/rpi-raspbian:buster

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    unzip \
    cmake \
    libssl-dev \
    automake \
    autoconf \
    libncurses5-dev \
    gcc \
    g++ \
    make \
    zlib1g-dev \
    libffi-dev \
    unixodbc \
    unixodbc-dev \
    jq

RUN cmake --version

RUN apt-get update && apt-get install -y \
    ssh \
    wget \
    git \
    zip \
    build-essential \
    debhelper \
    curl \
    unzip \
    debhelper \
    dpkg-dev \
    vim

WORKDIR /

RUN apt-get install -y gcc make zlib1g-dev libffi-dev libssl-dev \
    && wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz \
    && tar xvf Python-3.7.4.tgz \
    && cd Python-3.7.4 \
    && echo "_socket socketmodule.c" >> Modules/Setup.dist \
    && echo "_ssl _ssl.c -DUSE_SSL -I/usr/local/ssl/include -I/usr/local/ssl/include/openssl -L/usr/local/ssl/lib -lssl -lcrypto" >> Modules/Setup.dist \
    && ./configure --prefix=/usr/local/python3.7.4 \
    && make \
    && make install \
    && rm -rf /usr/bin/python3 /usr/bin/python \
    && ln -s /usr/local/python3.7.4/bin/python3.7 /usr/bin/python3 \
    && ln -s /usr/local/python3.7.4/bin/python3.7 /usr/bin/python
RUN curl -k -L -o /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py \
    && python /tmp/get-pip.py \
    && python3 /tmp/get-pip.py
ENV PATH=/usr/local/python3.7.4/bin:$PATH
ENV OPENSSL_ROOT_DIR=/usr/lib/arm-linux-gnueabihf/

COPY get-cmake.sh /get-cmake.sh
RUN /get-cmake.sh build 3.21.0

# cleanup
RUN apt-get clean\
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Elixir complains if runs without UTF-8
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

WORKDIR /
CMD [ "/bin/bash" ]
