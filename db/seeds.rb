# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

task1 = Task.create(title: "test1", category: "jobs", task: "testtask", deadline: Date.today)
task2 = Task.create(title: "test2", category: "others", task: "testtask2", deadline: Date.today)