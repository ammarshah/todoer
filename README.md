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
