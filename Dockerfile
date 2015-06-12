FROM assembla/java

RUN curl https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-0.20.6.tar.gz | \
    tar xvzf - -C /opt && \
    mv /opt/elasticsearch-* /opt/elasticsearch

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

