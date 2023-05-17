# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Team.delete_all
Employee.delete_all

puts "Teams deleted"
puts "Employees deleted"

puts "🌱 Seeding..."

11.times do 
    Team.create(name: Faker::Company.department)
end

puts "#{Team.count} teams have been created."


10.times do 
    Employee.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email, 
        manager: Faker::Boolean.boolean,
        team_id: rand(1..11)
    )
end

puts "#{Employee.count} employees have been created."

puts "✅ Done seeding!"