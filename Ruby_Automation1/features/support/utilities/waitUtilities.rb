POLL_FREQUENCY = 0.1
TIMEOUT = 10

require 'selenium-webdriver'
require 'selenium/webdriver/common/wait'

def element_visibility_wait(driver, xpath)
  wait = Selenium::WebDriver::Wait.new(timeout: TIMEOUT, interval: POLL_FREQUENCY)
  wait.until { driver.find_element(:xpath, xpath).displayed? }
end


# def element_clickable_wait(driver, element)
#   wait = Selenium::WebDriver::Wait.new(timeout: TIMEOUT, interval: POLL_FREQUENCY)
#   wait.until { driver.find_element(element).enabled? && driver.find_element(element).displayed? }
# end

