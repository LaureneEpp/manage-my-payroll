# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Departement.delete_all
Team.delete_all
Employee.delete_all

puts "Departments deleted"
puts "Teams deleted"
puts "Employees deleted"

puts "🌱 Seeding..."

10.times do 
    Departement.create(name: Faker::Company.department)
end

puts "#{Departement.count} departments have been created."

# 15.times do 
#     Team.create(name: Faker::Lorem.word, departement_id: rand(1..10))
# end

2.times do 
    Team.create(name: Faker::Lorem.word, departement_id: 1)
    Team.create(name: Faker::Lorem.word, departement_id: 2)
    Team.create(name: Faker::Lorem.word, departement_id: 3)
    Team.create(name: Faker::Lorem.word, departement_id: 4)
    Team.create(name: Faker::Lorem.word, departement_id: 5)
    Team.create(name: Faker::Lorem.word, departement_id: 6)
    Team.create(name: Faker::Lorem.word, departement_id: 7)
    Team.create(name: Faker::Lorem.word, departement_id: 8)
    Team.create(name: Faker::Lorem.word, departement_id: 9)
    Team.create(name: Faker::Lorem.word, departement_id: 10)    
end

puts "#{Team.count} teams have been created."

10.times do 
    Employee.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email, 
        manager: Faker::Boolean.boolean,
        team_id: rand(1..15)
    )
end

puts "#{Employee.count} employees have been created."

puts "✅ Done seeding!"