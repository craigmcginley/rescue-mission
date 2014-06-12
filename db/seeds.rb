# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'Craig', password: 'password')
Question.create(title: 'Does this test title work? Does this test title work?', body: 'I need to type atleast 150 characters here for this to work, I hope it does! Woooooooooo! Woooooooooo! Woooooooooo! Woooooooooo! Woooooooooo! Woooooooooo! Woooooooooo! Woooooooooo! Woooooooooo! Woooooooooo! Woooooooooo!', user_id: 1)
