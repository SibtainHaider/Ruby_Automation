require 'rubygems'
require 'selenium-webdriver'

Before do |scenario|
  browser = Selenium::WebDriver.for :chrome
  $browser = browser
  $browser.manage.window.maximize
end

After do |scenario|
  $browser.close
end
