require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'capybara-screenshot/cucumber'

Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, {debug: false})
end

Capybara.configure do |config|
  config.default_driver = :poltergeist
end
World(Capybara)

Capybara.save_path = "/opt/test_screenshots/"
