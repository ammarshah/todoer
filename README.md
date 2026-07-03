# Todoer

A simple to-do list app.

## Demo

This app is deployed on a free [Render](https://render.com) tier which [spins down the server if it's idle for 15 minutes](https://docs.render.com/free#spinning-down-on-idle), so it takes some time to spin up the server again when it next receives a request.

Demo URL: https://todoer-9s1j.onrender.com/

## Prerequisites

1. Install [rbenv](https://gist.github.com/ammarshah/7e9226271ef3b8b49861b7865b642d2d) for easily managing multiple Ruby versions.

## Project Setup

To set up this project, clone the repository and run the setup script:

```shell
$ git clone git@github.com:ammarshah/todoer.git
$ cd todoer
$ rbenv install
$ bin/setup
```

## Rails Credentials

The project's Rails master key (`config/master.key`) is **not** committed to the repository. Instead, an encrypted copy (`config/master.key.gpg`) is included.

During `bin/setup`, you'll be prompted for the shared passphrase to decrypt the master key and create `config/master.key`.

If you skip this step or enter an incorrect passphrase, you can decrypt it later by running:

```shell
$ bin/decrypt_master_key
```

> [!NOTE]
> Obtain the shared passphrase from the project owner or a team member.

> [!IMPORTANT]
> If you update the Rails credentials and generate a new `config/master.key`, remember to encrypt it before committing:
>
> ```shell
> $ bin/encrypt_master_key
> ```
>
> This overwrites `config/master.key.gpg` with an encrypted copy of the current `config/master.key`. Share the new passphrase with the team through a secure channel.

## Run Development Server

```shell
$ bin/dev
```

## Run Tests

```shell
# By default, it runs tests in a random order
$ bin/rails test

# Use --seed option if you want to run tests with seed
$ bin/rails test --seed YOUR_SEED

# Run all tests (including system tests)
$ bin/rails test:all
```

> [!TIP]
> To debug tests order dependency checkout [minitest-bisect](https://github.com/minitest/minitest-bisect) to get the minimum number of tests to run to reproduce the failure.

<!--
## Deployment

a. Build the image:

```shell
$ docker compose build
```

b. Tag the image with new build version:

```shell
$ docker tag ammarshah/todoer-server:latest ammarshah/todoer-server:1.0.0
```

c. Push the tag to your [Docker Hub](https://hub.docker.com) repository:

```shell
$ docker push ammarshah/todoer-server:1.0.0
$ docker push ammarshah/todoer-server:latest
```

d. Commit and push the latest code to your GitHub repository:

```shell
$ git push origin master
```

e. Login to your production server via ssh and pull the latest code from GitHub repository:

```shell
$ git pull origin master
```

f. Finally, use `docker compose` command to run the required services:

```shell
$ docker compose up -d
```

> [!NOTE]
> This will pull the latest (pre-built) image for each service, listed in `compose.yml`, from the Docker Hub registry and run the containers.

> [!IMPORTANT]
> Set the `APP_DOMAIN` environment variable to your application's public hostname (without the protocol), for example `todoer.example.com`. Rails uses this value when generating URLs in emails.

The application is accessible at [http://your-server-ip](http://your-server-ip).
-->
