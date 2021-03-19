FROM alfg/nginx-rtmp:1.2

# Download and unpack s6-overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.8.0/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

# Add s6 service and init scripts
ADD s6/cont-init.d /etc/cont-init.d
#ADD s6/services.d /etc/services.d

ADD nginx/nginx.conf /etc/nginx/nginx.conf.template
ADD www /var/www
RUN mkdir -p /opt/data/dash

#ENTRYPOINT ["/init"]
