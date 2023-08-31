require 'json'
require 'rspec/expectations'
require 'net/http'

file_path = 'testData/API_Data'
api_requests_path = 'testData/API_requests/'

Given('There is an API with {string}') do |url_variable|
  url_variable_edit = data_mod(url_variable)
  url = file_read(url_variable_edit, file_path)
  url = URI.parse(url)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = (url.scheme == 'https')
  request = Net::HTTP::Get.new(url.request_uri)
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  response = http.request(request)
  unless response.code.to_i == 200
    raise "The error code is: #{response.code}"
  end
  puts "Response Code: #{response.code}"
  puts "Response Body:\n#{response.body}"
end

Then('User Hit Post {string} with {string}') do |url_variable, post_json|
  json_edit = file_mod(post_json)
  api_path_updated = api_requests_path + json_edit
  data = json_data_get(api_path_updated)
  url_variable_edit = data_mod(url_variable)
  url = file_read(url_variable_edit, file_path)
  url = URI.parse(url)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = (url.scheme == 'https')
  request = Net::HTTP::Post.new(url.request_uri)
  request.set_form_data(data)
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  response = http.request(request)
  unless response.code.to_i == 201
    raise "The error code is: #{response.code}"
  end
  json_data = JSON.parse(response.body)
  unless json_data['id'] == data['id']
    raise "User created with wrong data: #{json_data['id']}"
  end
  puts "Response Code: #{response.code}"
  puts "Response JSON:\n#{json_data.inspect}"
  puts "Response Body:\n#{response.body}"
end

Then('User Hit Get {string}') do |url_variable|
  url_variable_edit = data_mod(url_variable)
  url = file_read(url_variable_edit, file_path)
  url = URI.parse(url)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = (url.scheme == 'https')
  request = Net::HTTP::Get.new(url.request_uri)
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  response = http.request(request)
  unless response.code.to_i == 200
    raise "The error code is: #{response.code}"
  end
  puts "Response Code: #{response.code}"
  puts "Response Body:\n#{response.body}"
end

Then('User Hit Put {string} with {string}') do |url_variable, post_json|
  json_edit = file_mod(post_json)
  api_path_updated = api_requests_path + json_edit
  data = json_data_get(api_path_updated)
  url_variable_edit = data_mod(url_variable)
  url = file_read(url_variable_edit, file_path)
  url = URI.parse(url)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = (url.scheme == 'https')
  request = Net::HTTP::Put.new(url.request_uri)
  request.set_form_data(data)
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  response = http.request(request)
  unless response.code.to_i == 200
    raise "The error code is: #{response.code}"
  end
  json_data = JSON.parse(response.body)
  unless json_data['id'] == data['id']
    raise "User created with wrong data: #{json_data['id']}"
  end
  puts "Response Code: #{response.code}"
  puts "Response JSON:\n#{json_data.inspect}"
  puts "Response Body:\n#{response.body}"
end


Then('User Hit Delete {string}') do |url_variable|
  url_variable_edit = data_mod(url_variable)
  url = file_read(url_variable_edit, file_path)
  # resp = requests.delete(str(url), verify=False)
  # assert (resp.status_code == 204), "The error code is: " + str(resp.status_code)
  url = URI.parse(url)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = (url.scheme == 'https')
  request = Net::HTTP::Delete.new(url.request_uri)
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  response = http.request(request)
  unless response.code.to_i == 204
    raise "The error code is: #{response.code}"
  end
  puts "Response Code: #{response.code}"
  puts "Response Body:\n#{response.body}"
end



