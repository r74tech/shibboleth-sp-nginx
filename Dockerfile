FROM pennlabs/shibboleth-sp-nginx:latest

COPY certs/sp.example.org.pem /etc/nginx/cert.pem
COPY certs/sp.example.org-key.pem /etc/nginx/key.pem

COPY shibboleth/ /etc/shibboleth/
COPY nginx/ /etc/nginx/conf.d/