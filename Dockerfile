FROM clojure:openjdk-16-lein-2.9.3-slim-buster as base

# mount source code here
VOLUME /opt

# override to specify your local user for correct file permissions
ENV UID=1000
ENV GID=1000
COPY docker-entrypoint.sh /root/docker-entrypoint.sh
ENTRYPOINT ["/root/docker-entrypoint.sh"]

COPY install-packages.sh /root/install-packages.sh
RUN /root/install-packages.sh \
  gosu \
  make \
  git \
  ca-certificates \
  openscad

# reconf ~/.m2 to /opt/.lein-m2
COPY lein-profiles.clj /etc/skel/.lein/profiles.clj

WORKDIR /opt
CMD ["/bin/bash"]
