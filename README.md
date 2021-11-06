## futu-opend-docker
> FutuOpenD in Docker

[![DockerHub Push](https://github.com/lok0613/futu-opend-docker/actions/workflows/push.yml/badge.svg)](https://github.com/lok0613/futu-opend-docker/actions/workflows/push.yml)

## Setup (for local)

Create a `.env` file
```
export FUTU_ACCOUNT=
export FUTU_PASSWORD=
```

```bash
~$ source .env
```

### Running for the first time

In terminal 1,
```bash
~$ docker run -i -t \
   -e login_account=$FUTU_ACCOUNT \
   -e login_pwd=$FUTU_PASSWORD \
   -e telnet_ip=0.0.0.0 \
   -e telnet_port=22222 \
   -p 11111:11111 \
   -p 22222:22222 \
   lok0613/futu-opend-docker:v5.9.2108.1
```

In terminal 2,
```bash
~$ telnet 127.0.0.1 22222
~$ > input_phone_verify_code -code=123456
```

### Running after the verification

```bash
~$ docker run -i -t \
   -e login_account=$FUTU_ACCOUNT \
   -e login_pwd=$FUTU_PASSWORD \
   -p 11111:11111 \
   lok0613/futu-opend-docker:v5.9.2108.1
```
