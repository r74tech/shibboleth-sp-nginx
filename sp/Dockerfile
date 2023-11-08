FROM pennlabs/shibboleth-sp-nginx:latest

ENV APP_HOME=/usr/src/sp

RUN mkdir -p $APP_HOME 

WORKDIR $APP_HOME 

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# 必要な証明書をコピー
COPY ./certs/sp.example.org.pem /etc/nginx/cert.pem
COPY ./certs/sp.example.org-key.pem /etc/nginx/key.pem

# 生成された証明書を/etc/shibboleth/に一括コピー
COPY ./shibboleth/ /etc/shibboleth/