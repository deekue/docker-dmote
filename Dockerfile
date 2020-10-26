# Requires BuildKit, to include OpenSCAD build with --build-arg WITH=openscad
ARG WITH=base

# TODO add an ARG for clojure version
FROM clojure:openjdk-16-lein-2.9.3-slim-buster as base

# mount source code here
VOLUME /opt

# override to specify your local user for correct file permissions
ENV UID=1000
ENV GID=1000
COPY docker-entrypoint.sh /root/docker-entrypoint.sh
ENTRYPOINT ["/root/docker-entrypoint.sh"]

# reconf ~/.m2 to /opt/.lein-m2
COPY lein-profiles.clj /etc/skel/.lein/profiles.clj

COPY install-packages.sh /root/install-packages.sh

FROM base AS install-base
RUN /root/install-packages.sh \
  gosu \
  make \
  git \
  ca-certificates

FROM base AS install-openscad
RUN /root/install-packages.sh \
  gosu \
  make \
  git \
  ca-certificates \
  openscad

FROM install-${WITH} AS install

WORKDIR /opt
CMD ["/bin/bash"]

