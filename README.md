# Todoer

This app was built while learning TDD from [Test-Driven Rails](https://thoughtbot.com/upcase/test-driven-rails) tutorial on [Upcase](https://thoughtbot.com/upcase).

But I soon felt an urge for using the BDD's outside-in approach and I decided to include [Cucumber](https://cucumber.io/) in the picture along with [Capybara](https://teamcapybara.github.io/capybara/) and [RSpec](https://rspec.info/).

Also, it uses latest versions of Ruby (v3.2) and Rails (v7) at the time.

## Project Setup

To setup this project, you'll want to clone and run the setup script for the repo.

```shell
$ git clone git@github.com:ammarshah/todoer.git
$ cd todoer
$ cp .env.template .env && cp .env.production.template .env.production
$ bin/setup
```

## Run Tests

Run RSpec tests:

```shell
$ rspec
```

Run Cucumber tests:

```shell
$ cucumber
```

Run all tests:

```shell
$ rake
```
