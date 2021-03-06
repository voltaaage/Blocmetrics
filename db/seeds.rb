# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Create admin
admin = User.new(
  name: 'Administrator',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)
admin.skip_confirmation!
admin.save!

# Create premium
premium = User.new(
  name: 'Premium Member',
  email: 'premium@example.com',
  password: 'helloworld',
  role: 'premium'
)
premium.skip_confirmation!
premium.save!

# Create standard
standard = User.new(
  name: 'Standard User',
  email: 'standard@example.com',
  password: 'helloworld',
  role: 'standard'
)
standard.skip_confirmation!
standard.save!

# Create users
10.times do
  user = User.new(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: 'helloworld'
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Registered Applications
10.times do
  app = RegisteredApplication.new(
    name: Faker::Lorem.sentence,
    url: Faker::Internet.url
  )
  app.save!
end
blocipedia = RegisteredApplication.new(
  name: "Blocipedia",
  url: "http://localhost:4000"
)
blocipedia.save!

registered_applications = RegisteredApplication.all

# 25.times do
#   event = Event.new(
#     name: Faker::Lorem.sentence,
#     description: Faker::Lorem.paragraph,
#     registered_application: registered_applications.sample
#   )
#   event.save!
# end

puts "#{User.count} users were created."
puts "#{RegisteredApplication.count} registered applications were created."
puts "#{Event.count} events were created."
