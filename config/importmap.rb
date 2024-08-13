# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "toastify-js", to: "https://cdn.jsdelivr.net/npm/toastify-js@1.12.0/+esm"
pin_all_from "app/javascript/controllers", under: "controllers"
