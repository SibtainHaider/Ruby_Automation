require 'rubygems'
require 'selenium-webdriver'

Before do |scenario|
  browser = Selenium::WebDriver.for :chrome
  $driver = browser
  $driver.manage.window.maximize
end

After do |scenario|
  $driver.close
end
