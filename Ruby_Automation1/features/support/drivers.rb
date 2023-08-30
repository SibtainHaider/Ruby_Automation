require 'selenium-webdriver'
require_relative '../support/utilities/waitUtilities'

def find_ele_xp(xpath)
  element_visibility_wait($driver, xpath)
  element = $driver.find_element(:xpath, xpath)
  return element
end

def clicker(element)
  # element_clickable_wait($driver, element)
  element.click
end

def switch_to_child_window
  child = $driver.window_handles[1]
  $driver.switch_to.window(child)
end

def switch_to_parent_window
  parent = $driver.window_handles[0]
  $driver.switch_to.window(parent)
end

