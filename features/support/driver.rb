# Sets the default javascript driver for examples tagged with @javascript
#
# There's a special reason for using :selenium_headless instead of :selenium_chrome_headless
# :selenium_chrome_headless runs the server in a different thread and, thus does not share the
# same transaction as your tests, causing data not to be shared between your test and test server.
Capybara.javascript_driver = :selenium_headless
