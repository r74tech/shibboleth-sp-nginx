# shibboleth-sp-nginx

## description

1. first, run `make certs` to generate the certs for the encrypt, signing keys
```bash
make certs
```

2. then, run `make up` to build and run the docker containers
```bash
make up
```

3. access the service at `https://sp.example.org`. you may need to add the following to your `/etc/hosts` file
```bash
127.0.0.1 sp.example.org
```

## license
Copyright (c) 2023 R74


## references
- https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065335537/Installation
- https://github.com/pennlabs/docker-shibboleth-sp-nginx [MIT License] Penn Labs