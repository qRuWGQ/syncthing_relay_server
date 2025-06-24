#!/bin/bash

TOKEN=$(openssl rand -base64 32)

echo -e "API Token: \033[32m ${TOKEN} \033[0m"

/usr/bin/strelaysrv -pools= -status-srv= -token=$TOKEN