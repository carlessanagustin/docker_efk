FROM fluent/fluentd:v1.2.6-debian

ENV pluginDeps="sudo ruby-dev build-essential"
ENV fluentPluginElasticsearch=2.12.0
ENV fluentdUi=1.2.0

RUN  apt-get update \
  && apt-get install -y --no-install-recommends $pluginDeps

RUN sudo gem install \
       fluent-plugin-elasticsearch --no-rdoc --no-ri \
       --version $fluentPluginElasticsearch

ENV uiDeps="libz-dev"
RUN apt-get install -y --no-install-recommends $uiDeps \
 && sudo gem install \
      fluentd-ui --no-rdoc --no-ri \
      --version $fluentdUi

RUN sudo gem sources --clear-all \
 && SUDO_FORCE_REMOVE=yes \
    apt-get purge -y --auto-remove \
      -o APT::AutoRemove::RecommendsImportant=false \
      $pluginDeps $uiDeps \
 && rm -rf /var/lib/apt/lists/*

# RUN rm -rf /home/fluent/.gem/ruby/2.3.0/cache/*.gem \
#  && gem cleanup fluent-plugin-elasticsearch \
#  && gem cleanup fluentd-ui

WORKDIR /fluentd

# fluent:x:1000:1000::/home/fluent:
# ENV FLUENT_UID=1000
# USER fluent
