FROM debian:12-slim

WORKDIR /relaysr

COPY entrypoint.sh ./entrypoint.sh

RUN apt update -y \
  && apt install -y curl apt-transport-https openssl \
  && mkdir -p /etc/apt/keyrings \
  && curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg \
  && echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | tee /etc/apt/sources.list.d/syncthing.list \
  && printf "Package: *\nPin: origin apt.syncthing.net\nPin-Priority: 990\n" | tee /etc/apt/preferences.d/syncthing.pref \
  && apt update && apt install syncthing-relaysrv \
  && apt autoremove && apt clean \
  && chmod +x /entrypoint.sh
  
ENTRYPOINT ["./entrypoint.sh"]