FROM ubuntu:14.04

ENV HOME /root

ADD build /tmp/build/
VOLUME ["/var/log/nginx", "/var/www"]
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  curl -sL https://deb.nodesource.com/setup | bash - && \
  apt-get install -y build-essential nodejs nginx && \
  rm -f /etc/nginx/conf.d/* /etc/nginx/sites-enabled/* && \
  cp /tmp/build/nginx/app.conf /etc/nginx/sites-enabled/app && \
  cp /tmp/build/entrypoint.sh /root/ && \
  chmod 755 /root/entrypoint.sh

EXPOSE 80

WORKDIR /var/www/server
ENTRYPOINT ["/root/entrypoint.sh"]
