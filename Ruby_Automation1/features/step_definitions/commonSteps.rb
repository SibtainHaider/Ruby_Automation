require_relative '../support/methods'
require 'json'
require 'rspec/expectations'



Given('User is on the {string} page on {string}') do |web_name, filename|
  file_name = 'testData/'+filename
  website = file_read(web_name, file_name)
  $driver.get(website)
end

# When('User Click on {string} on {string}') do |button_name, filename|
#   file_name = 'locators/'+filename
#   locator = file_read(button_name, file_name)
#   element = find_ele_xp(locator)
#   clicker(element)
# end

When('User Click on {string} on {string}') do |button_name, filename|
  file_name_update = file_mod(filename)
  data_update = data_mod(button_name)
  file_name = 'locators/'+file_name_update
  locator = file_read(data_update, file_name)
  enum_path = "../support/enum/#{filename}"
  require_relative enum_path
  element = find_ele_xp(Xpaths_enum::Button_paths[locator])
  clicker(element)
end


Then('User enter {string} in {string} on {string}') do |data, container, filename|
  file_name_update = file_mod(filename)
  data_update = data_mod(container)
  file_name = 'locators/'+file_name_update
  locator = file_read(data_update, file_name)
  enum_path = "../support/enum/#{filename}"
  require_relative enum_path
  element = find_ele_xp(Xpaths_enum::Button_paths[locator])
  clicker(element)
  file_name = 'testData/'+filename
  data = file_read(data, file_name)
  writer(data, element)
end

Then('User selects {string} on {string} from {string}') do |data, container, filename|

end

