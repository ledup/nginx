FROM centos:7
MAINTAINER Didier BONNEFOI <dbonnefoi@prestaconcept.net>

RUN rpm --import http://mirror.centos.org/centos/7/os/x86_64/RPM-GPG-KEY-CentOS-7 \
    && yum install -y http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm \
    && yum install -y nginx iproute bash-completion \
    && yum clean all

RUN mkdir /etc/nginx/snippets
ADD conf/nginx/snippets/*.conf /etc/nginx/snippets/
ADD conf/nginx/site.conf /etc/nginx/conf.d/default.conf

ADD scripts/run.sh scripts/entry.sh /
RUN chmod a+x /run.sh /entry.sh

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

ENTRYPOINT ["/entry.sh"]

CMD [ "/run.sh" ]
