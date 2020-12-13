# docker-squid

Squid on Docker

## Build Image

```shell
git clone https://github.com/s-yoshiki/docker-squid.git
cd docker-squid
docker-compose -f docker-compose.build.yml build
```

## Run Docker

```shell
docker-compose up -d 
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