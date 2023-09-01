require 'pg'
require 'rspec/expectations'


Given('User verifies {string} operations with {string} on {string} with {string}') do |database_credentials, query, filename, expected_output|
  file_name_update = file_mod(filename)
  database_update = data_mod(database_credentials)
  query_update = data_mod(query)
  expected_output_update = data_mod(expected_output)
  file_name = 'testData/'+file_name_update
  database_credentials_get = file_read(database_update, file_name)
  query_get = file_read(query_update, file_name)
  ex_output_get = file_read(expected_output_update, file_name)

  db_connection = PG.connect(
    database_credentials_get
  )
  puts("the query is: ",query_get)
  result = db_connection.exec(query_get)

  expected_output = ex_output_get
  result.each do |row|
    puts row['order_id']
  end
  db_connection.close
end

