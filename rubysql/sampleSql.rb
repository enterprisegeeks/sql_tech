# encoding: utf-8
require 'mysql2'

user = ENV['DB_USER']
host = ENV['DB_HOST']
port = ENV['DB_PORT']
pass = ENV['DB_PASSWORD']
db = ENV['DB_DATABASE']

client = Mysql2::Client.new(:host =>host, :username =>user , :password =>pass,
		 :port => port, :database => db)
query = %q{select * from example where name like 'A%'}
result = client.query(query)

puts "ID\tname"

result.each do |row|
    	id=row['ID']
	name=row['name']
	puts "#{id}\t#{name}"
end


