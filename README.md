# Todoer

This app was built while learning TDD from [Test-Driven Rails](https://thoughtbot.com/upcase/test-driven-rails) tutorial on [Upcase](https://thoughtbot.com/upcase).

But I soon felt an urge for using the BDD's outside-in approach and I decided to include [Cucumber](https://cucumber.io/) in the picture along with [Capybara](https://teamcapybara.github.io/capybara/) and [RSpec](https://rspec.info/).

Also, it uses the latest version of Ruby (v3) and Rails (v7) at the time.

## Project Setup

To setup this project, you'll want to clone and run the setup script for the repo.

```shell
$ git clone git@github.com:ammarshah/todoer.git
$ cd todoer
$ cp .env.template .env
$ bin/setup
```

## Run Tests

Run RSpec tests:

```shell
# By default, it runs tests in a random order
$ rspec

# Use --seed option if you want to run tests with seed
$ rspec --seed=YOUR_SEED

# For debugging specs order dependency
# use --bisect option to get the minimum
# number of tests to run to reproduce the failure
$ rspec --bisect --seed=YOUR_SEED
```

Run Cucumber tests:

```shell
# By default, it runs tests in a random order
$ cucumber

# Use --order option if you want to run tests with seed
$ cucumber --order=random:YOUR_SEED
```

Run all tests:

```shell
$ rake
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