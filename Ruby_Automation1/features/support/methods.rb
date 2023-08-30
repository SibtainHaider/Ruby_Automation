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
  value = config[web_name]
  return value
end

def writer(data, container)
  container.send_keys(data)
end


def file_mod(file_name)
  file_name.gsub(" ", "")
end


def data_mod(data)
  data.gsub(" ", ".")
end