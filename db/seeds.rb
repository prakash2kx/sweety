# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "prakash@mail.com", password: "12345", user_type: 0)
User.create(email: "prakash1@mail.com", password: "12345", user_type: 0)
User.create(email: "doctor@mail.com", password: "12345", user_type: 1)