FROM docker.elastic.co/elasticsearch/elasticsearch:5.6.16
RUN echo "xpack.security.enabled: false" >> /usr/share/elasticsearch/config/elasticsearch.yml
RUN bin/elasticsearch-plugin install analysis-icu && \
    bin/elasticsearch-plugin install analysis-phonetic