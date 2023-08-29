require 'selenium-webdriver'
require "json"

def file_read(web_name, file_name)
  config_file_path = 'features/support/' + file_name + '.json'

  begin
    config_data = File.read(config_file_path)
    config = JSON.parse(config_data)
  rescue Errno::ENOENT
    puts "Config file not found: #{config_file_path}"
    exit
  rescue JSON::ParserError
    puts "Invalid JSON format in the config file."
    exit
  end
  url = config[web_name]
  return url
end


# def clicker(button)
#   button
# end
