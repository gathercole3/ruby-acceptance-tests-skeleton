FROM ruby:2.1

## Install Phantomjs
RUN export PHANTOM_JS="phantomjs-2.1.1-linux-x86_64" && \
  wget -q https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2  && \
  mv $PHANTOM_JS.tar.bz2 /usr/local/share/  && \
  cd /usr/local/share/  && \
  tar xvjf $PHANTOM_JS.tar.bz2  && \
  ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/share/phantomjs  && \
  ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin/phantomjs  && \
  ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/bin/phantomjs

COPY /Gemfile /opt/
COPY /Gemfile.lock /opt/

RUN bundle install --gemfile=/opt/Gemfile

COPY / /opt/

WORKDIR /opt

CMD ["rake"]
