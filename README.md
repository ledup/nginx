# NginX

Docker image for NginX made to use with led.

## Available versions

| Tag         | Description                             |
| ----------- | --------------------------------------- |
| **stable**  | NginX 1.24 on RockyLinux 9              |

## Usage

NginX runs with user "dev". The user is created at boot in the entrypoint script with the uid from env variable `_UID`.

NginX listens on 80 (http)

### Document Root

NginX docroot is `/src/`, you have to mount volume on `/src`.

If your project's document root must be in a subdirectory, You can configure the relative path from `/src` in the environment variable `LED_DOCROOT`.

### Use NginX with PHP-FPM

#### Service configuration

The NginX configuration is prepared for PHP-FPM with a fake TCP socket `127.0.0.1:9000` to allow startup

You must set the environment variable `LED_PHPFPM_SOCKET` with a valid remote host (like `phpfpm:9000`). This will enable NginX FastCGI snippet file

#### Use single controller

If you want use a single controller where redirect every request, use the `REDIRECT_CONTROLLER` environment variable to specify it. (default value is `index.php`)
