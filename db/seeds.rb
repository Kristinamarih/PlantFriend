# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.find_or_create_by(name: 'Vegetable')
Category.find_or_create_by(name: 'Fruit')
Category.find_or_create_by(name: 'Flower')
Category.find_or_create_by(name: 'Nuts & Seeds')
Category.find_or_create_by(name: 'Plant')
Category.find_or_create_by(name: 'Other')

Message.create(body: 'Welcome to your inbox')
