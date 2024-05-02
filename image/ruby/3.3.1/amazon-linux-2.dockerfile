# Docker image to use.
FROM sloopstash/base-amazon-linux-2:v1.1.1

# Install system packages.
RUN set -x \
  && yum install -y gcc openssl-devel readline-devel zlib-devel libyaml-devel

# Download and extract Ruby.
WORKDIR /tmp
RUN set -x \
  && wget https://cache.ruby-lang.org/pub/ruby/3.3/ruby-3.3.1.tar.gz \
  && tar -xzvf ruby-3.3.1.tar.gz \
  && cd ruby-3.3.1 \
  && ./configure \
  && make \
  && make install \
  && rm -rf /tmp/ruby-3.3.1*

# Create App directories.
RUN set -x \
  && mkdir /opt/app \
  && mkdir /opt/app/source \
  && mkdir /opt/app/log \
  && history -c

# Set the working directory.
WORKDIR /opt/app






