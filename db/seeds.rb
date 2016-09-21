# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = User.new
# user.password = 'amazing'
# user.password => '$2a$10$4LEA7r4YmNHtvlAvHhsYAeZmkxeUVtMTYqwIvYY76EW5GUqDiP4.'

user = User.new
user.password = 'security'


phil = User.new(name: 'Phil', email: 'phil@example.com', password: 'password')
phil.save
