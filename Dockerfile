FROM ruby:2.7.6-alpine

RUN apk update && \
    apk --no-cache --update add nodejs build-base libpq postgresql-dev postgresql-client gcompat tzdata nano -q && \
    rm -rf /var/lib/apt/lists/*

ENV WORK_ROOT /src
ENV APP_HOME $WORK_ROOT/myapp/
ENV LANG C.UTF-8
ENV GEM_HOME $WORK_ROOT/bundle
ENV BUNDLE_BIN $GEM_HOME/gems/bin
ENV PATH $GEM_HOME/bin:$BUNDLE_BIN:$PATH

RUN gem install bundler

RUN mkdir -p $APP_HOME

RUN bundle config --path=$GEM_HOME && bundle config set force_ruby_platform true 

WORKDIR $APP_HOME

ADD Gemfile ./
ADD Gemfile.lock ./
RUN bundle install

ADD . $APP_HOME

CMD ["/bin/ash", "bin/startup.sh"]
