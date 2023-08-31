require 'rubygems'
require 'selenium-webdriver'
require 'net/http'
# require 'pg'

Before do |scenario|
  browser = Selenium::WebDriver.for :chrome
  $driver = browser
  $driver.manage.window.maximize
end

After do |scenario|
  $driver.close
end
