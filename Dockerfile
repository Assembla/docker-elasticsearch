FROM dockerfile/java

RUN \
  cd /tmp && \
  curl https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.20.6.tar.gz | \
  tar xz && \
  mv /tmp/elasticsearch-0.20.6 /opt/elasticsearch

COPY elasticsearch.yml /opt/elasticsearch/config/

# Define mountable directories.
VOLUME ["/data", "/logs"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["/opt/elasticsearch/bin/elasticsearch", "-f"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300

