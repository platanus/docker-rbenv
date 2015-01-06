FROM platanus/apt

MAINTAINER Juan Ignacio Donoso "juan.ignacio@platan.us"

# Env variable to make rbenv work
ENV HOME /root
ENV RBENV_ROOT /usr/local/rbenv
ENV PATH ${RBENV_ROOT}/bin:${RBENV_ROOT}/shims:${PATH}

# Install rbenv
RUN cd /usr/local && \
    curl -L https://github.com/sstephenson/rbenv/archive/v0.4.0.tar.gz | tar xz && \
    mv rbenv-0.4.0 rbenv

# Install rbenv vars plugin
RUN mkdir -p /usr/local/rbenv/plugins && \
    cd /usr/local/rbenv/plugins && \
    curl -L https://github.com/sstephenson/rbenv-vars/archive/master.tar.gz | tar xz && \
    mv rbenv-vars-master rbenv-vars

# Install ruby build rbenv gem-rehash plugin
RUN mkdir -p /usr/local/rbenv/plugins && \
    cd /usr/local/rbenv/plugins && \
    curl -L https://github.com/sstephenson/rbenv-gem-rehash/archive/master.tar.gz | tar xz && \
    mv rbenv-gem-rehash-master rbenv-gem-rehash

# Install ruby build rbenv plugin
RUN mkdir -p /usr/local/rbenv/plugins && \
    cd /usr/local/rbenv/plugins && \
    curl -L https://github.com/sstephenson/ruby-build/archive/master.tar.gz | tar xz && \
    mv ruby-build-master ruby-build
