# Syncthing 中继服务器

## 使用方法

```shell
git clone https://github.com/qRuWGQ/syncthing_relay_server.git && cd syncthing_relay_server

docker build -t strelay:v1 .

docker run -p 22067:22067 -name strelay -d strelay:v1

```
