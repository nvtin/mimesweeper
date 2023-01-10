# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "jquery", to: "jquery.min.js", preload: true
pin "jquery_ujs", to: "jquery_ujs.js", preload: true
pin "bootstrap", to: "bootstrap.min.js"
pin "@popperjs/core", to: "popper.js"
pin_all_from "app/javascript/custom", under: "custom"