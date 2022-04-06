# zerotier-moon-zeronsd

2 in 1 docker image of zerotier, including zerotier & zerotier moon.

## Prerequ

## Run with docker

Replace `<public_ip>`, `<network_id>` with your own config.

```bash
docker run -d --restart always \
--network host \
--cap-add NET_ADMIN \
-v /dev:/dev \
-v $(pwd)/data:/var/lib/zerotier-one \
--name zerotier \
wqyjh/zerotier-moon -4 <public_ip> -n <network_id>
```

## Run with docker-compose



Replace `<public_ip>`, `<network_id>` with your own config.

```yaml
version: "3"

services:
  zerotier:
    image: wqyjh/zerotier-moon
    container_name: "zerotier"
    restart: always
    network_mode: "host"
    cap_add:
    - NET_ADMIN
    volumes:
      - /dev:/dev
      - ./data:/var/lib/zerotier-one
    entrypoint: /startup.sh -4 <public_ip> -n <network_id>
```
