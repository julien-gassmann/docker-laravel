# docker-laravel
Base images (php + nginx) for Laravel development.

---

# Build / Tag / Push :

## php:base

In root directory :
```
docker build -f php/base/Dockerfile -t php:base .
docker tag php:base juliengss/php:base
docker push juliengss/php:base
```

## php:dev

In root directory :
```
docker build -f php/dev/Dockerfile -t php:dev .
docker tag php:dev juliengss/php:dev
docker push juliengss/php:dev
```

## php:package

In root directory :
```
docker build -f php/package/Dockerfile -t php:package .
docker tag php:package juliengss/php:package
docker push juliengss/php:package
```

## nginx:base

In root directory :
```
docker build -f nginx/base/Dockerfile -t nginx:base .
docker tag nginx:base juliengss/nginx:base
docker push juliengss/nginx:base
```

## nginx:dev

In root directory :
```
docker build -f nginx/dev/Dockerfile -t nginx:dev .
docker tag nginx:dev juliengss/nginx:dev
docker push juliengss/nginx:dev
```