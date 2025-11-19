set -e

cd /usr/src/app/

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
else
  php-fpm
fi

exec "$@"