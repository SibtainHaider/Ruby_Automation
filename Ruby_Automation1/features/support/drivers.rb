require 'selenium-webdriver'

def find_ele_xp(xpath)
  element = $browser.find_element(:xpath, xpath)
  return element
end

def clicker(element)
  # $browser.find_element(:xpath, xpath).click
  element.click
end