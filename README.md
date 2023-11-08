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
Copyright (c) 2019 Penn Labs

Copyright (c) 2023 R74