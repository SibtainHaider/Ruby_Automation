require 'rubygems'
require 'net/http'
require 'em/pure_ruby'
require 'appium_lib'
require 'selenium-webdriver'



Before do |scenario|

  file_name  = 'Config'
  driver = file_read('source', file_name)

  case driver
  when 'mobile/desktop'
    platform_Name = file_read("platformName", file_name)
    puts(platform_Name)
    app_name = file_read("appium:app",file_name)
    platform_version = file_read('appium:platformVersion',file_name)

    caps = {
      caps: {
        platformName: platform_Name,
        app: app_name,
        platformVersion: platform_version
      },
      appium_lib: {
        server_url: 'http://127.0.0.1:4723/wd/hub'
      }
    }
    driver_setup = Appium::Driver.new(caps, true)
    $driver = driver_setup
    $driver.start_driver

  when 'web'
    selenium_driver = file_read('selenium_driver', file_name)
    case selenium_driver
    when 'Edge'
      driver_setup = Selenium::WebDriver.for :edge
      $driver = driver_setup
    when 'Chrome'
      driver_setup = Selenium::WebDriver.for :chrome
      $driver = driver_setup
    end
    $driver.manage.window.maximize
  end


end

After do |scenario|
  $driver.driver_quit
end

