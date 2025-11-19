set -e

cd /usr/src/app/

echo "Launching migration..."
php artisan migrate --force

echo "Optimize route, view and config"
php artisan optimize
php artisan view:cache

echo "Create symlink"
php artisan storage:link

echo "Launching fpm..."
# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
else
  php-fpm
fi

exec "$@"
