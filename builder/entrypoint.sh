#!/bin/bash

APPS_DIR=/apps
TYGER_ROOT=$APPS_DIR/Tyger2
TYGER_DIR=$TYGER_ROOT/backend
TYGER_DATA=$TYGER_ROOT/data
TYGER_LOGS=$TYGER_ROOT/logs

#if [ -e $TYGER_DATA/db.sqlite3 ]
#then
#  python3 $TYGER_DIR/manage.py migrate
#else
#  printf "Assuming new install\n"
#fi

#if [ -e $TYGER_DATA/caddyfile.conf ]
#then
#  printf "Looks installed, doing nothing\n"
#else
#  cp $TYGER_DIR/caddyfile.conf $TYGER_DATA
#fi
#!/bin/bash
set -e

if [ "$1" = 'start' ]; then
    uwsgi -d --emperor $TYGER_ROOT/install/uwsgi.ini \
    && caddy -log $TYGER_LOGS/caddyservice.log -pidfile=$TYGER_DATA/caddypid.txt -agree=true -conf=$TYGER_DATA/caddyfile.conf -root=/var/tmp
    exec gosu start "$@"
fi

exec "$@"
