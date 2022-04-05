# zerotier-moon-zeronsd

3 in 1 docker image of zerotier, including zerotier, zerotier moon, zeronsd.

## Run with docker

Replace `<your_ip>`, `<your_network_id>`, `<your_domain>` with your own config.

```bash
docker run -d --restart always \
--network host \
--cap-add NET_ADMIN \
--cap-add NET_BINDSERVICE \
-v /dev:/dev \
-v $(pwd)/data:/var/lib/zerotier-one \
--name zerotier \
wqyjh/zerotier-moon-zeronsd -4 <your_ip> -n <your_network_id> -t /var/lib/zerotier-one/token -d <your_domain>
```

## Run with docker-compose

Replace `<your_ip>`, `<your_network_id>`, `<your_domain>` with your own config.

```yaml
version: "3"

services:
  zerotier:
    image: wqyjh/zerotier-moon-zeronsd
    container_name: "zerotier"
    restart: always
    network_mode: "host"
    cap_add:
    - NET_ADMIN
    - NET_BIND_SERVICE
    volumes:
      - /dev:/dev
      - ./:/var/lib/zerotier-one
    entrypoint: /startup.sh -4 <your_ip> -n <your_network_id> -t /var/lib/zerotier-one/token -d <your_domain>
```
