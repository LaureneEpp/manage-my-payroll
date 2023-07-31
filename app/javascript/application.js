// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "./custom/sideMenu.js"
import "./custom/modal.js"
import "./custom/boxSelection.js"
import "./custom/dropdown.js"
Rails.start()
Turbolinks.start()
ActiveStorage.start()