# docker-squid

Squid on Docker

## Build Image

```shell
git clone https://github.com/s-yoshiki/docker-squid.git
cd docker-squid
docker-compose  build
```

## Run Docker

```shell
docker-compose -f docker-compose.tmpl.yml up -d
curl https://www.google.com -x http://localhost:3128
```

## Files

```
./
├── Dockerfile
├── README.md
├── docker-compose.build.yml
├── docker-compose.yml
├── entrypoint.sh
└── squid-conf
    ├── squid-log.conf
    └── squid.conf
```