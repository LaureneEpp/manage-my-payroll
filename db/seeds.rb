# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Employee.delete_all

puts "Employees deleted"

puts "🌱 Seeding..."

10.times do 
    Employee.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email, 
        manager: Faker::Boolean.boolean,
        team: Faker::Company.department
    )
end

puts "#{Employee.count} employees have been created."

puts "✅ Done seeding!"