FROM rockylinux/rockylinux:9.5

LABEL org.opencontainers.image.authors="Didier BONNEFOI <dbonnefoi@prestaconcept.net>"

RUN dnf module -y enable nginx:1.24 \
    && dnf install -y nginx iproute bash-completion \
    && dnf clean all

RUN mkdir /etc/nginx/snippets
ADD shared/conf/nginx/snippets/*.conf /etc/nginx/snippets/
ADD shared/conf/nginx/site.conf /etc/nginx/conf.d/default.conf

ADD shared/scripts/run.sh shared/scripts/entry.sh /
RUN chmod a+x /run.sh /entry.sh

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

ENTRYPOINT ["/entry.sh"]

CMD [ "/run.sh" ]
