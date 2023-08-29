require_relative '../support/methods'
require 'json'
require 'rspec/expectations'


Given('User is on the {string} page on {string}') do |web_name, filename|
  file_name = 'testData/'+filename
  website = file_read(web_name, file_name)
  $browser.get(website)
end

When('User Click on {string} on {string}') do |button_name, filename|
  file_name = 'locators/'+filename
  locator = file_read(button_name, file_name)
  element = find_ele_xp(locator)
  clicker(element)
  # sleep(10)
end