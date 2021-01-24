#!/bin/sh
set -e

ENV_VARIABLES=$(awk 'BEGIN{for(v in ENVIRON) print "$"v}')

for FILE in /etc/crontabs/root
do
    envsubst "$ENV_VARIABLES" <$FILE | sponge $FILE
done

/usr/sbin/crond -f