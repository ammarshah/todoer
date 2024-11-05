# Todoer

This app was built while learning TDD from [Test-Driven Rails](https://thoughtbot.com/upcase/test-driven-rails) tutorial on [Upcase](https://thoughtbot.com/upcase).

But I soon felt an urge for using the BDD's outside-in approach and I decided to include [Cucumber](https://cucumber.io/) in the picture along with [Capybara](https://teamcapybara.github.io/capybara/) and [RSpec](https://rspec.info/).

Also, it uses the latest version of Ruby (v3) and Rails (v7) at the time.

## Demo

This app is deployed on a free [Render](https://render.com) tier which [spins down the server if it's idle for 15 minutes](https://docs.render.com/free#spinning-down-on-idle), so it takes some time to spin up the server again when it next receives a request.

Demo URL: https://todoer-9s1j.onrender.com/

## Prerequisites

1. Install [PostgreSQL](https://www.liberiangeek.net/2024/04/install-postgresql-psql-ubuntu-24-04) database

2. Install `libpq` library to successfully install `pg` gem

   ```shell
   $ sudo apt install libpq-dev
   ```

3. Setup [rbenv](https://gist.github.com/ammarshah/b78f09fcd526a7c5db3a7273d29d0032) for easily managing multiple Ruby versions

## Project Setup

To setup this project, you'll want to clone and run the setup script for the repo.

```shell
$ git clone git@github.com:ammarshah/todoer.git
$ cd todoer
$ rbenv install
$ cp .env.template .env
$ bin/setup
```

## Run Tests

Run RSpec tests:

```shell
# By default, it runs tests in a random order
$ bundle exec rspec

# Use --seed option if you want to run tests with seed
$ bundle exec rspec --seed=YOUR_SEED

# For debugging specs order dependency
# use --bisect option to get the minimum
# number of tests to run to reproduce the failure
$ bundle exec rspec --bisect --seed=YOUR_SEED
```

Run Cucumber tests:

```shell
# By default, it runs tests in a random order
$ bundle exec cucumber

# Use --order option if you want to run tests with seed
$ bundle exec cucumber --order=random:YOUR_SEED
```

Run all tests:

```shell
$ bin/rake
```

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

Note: This will pull the latest (pre-built) image for each service, listed in `compose.yml`, from the Docker Hub registry and run the containers.

The application is accessible at [http://your-server-ip](http://your-server-ip).
