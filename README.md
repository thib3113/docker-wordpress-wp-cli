# docker-wordpress-wp-cli
This repository contains the Dockerfile for the autobuild of [wordpress-with-wp-cli](https://registry.hub.docker.com/u/thib3113/docker-wordpress-wp-cli/) Docker image.

The Dockerfile uses the official WordPress image and adds [wp-cli](http://wp-cli.org/).

To use, simply run: 

    docker run --name <containername> thib3113/wordpress-with-wp-cli

For all other configuration items, please see the official Docker WordPress [ReadMe](https://github.com/docker-library/docs/tree/master/wordpress).

After you've completed the WordPress installation via the browser, you call the standard wp-cli commands via `docker exec`. For example, to install and activate the Quark theme:

    docker exec <containername> wp theme install quark
    docker exec <containername> wp theme activate quark

Please feel free to fork and use for your own projects.
