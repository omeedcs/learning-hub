# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tutorial.create([
    { name: "For-Loops", url: "For-Loops", parent_id: 1},
    { name: "While-Loops", url: "While-Loops", parent_id: 1},
    { name: "For-Each-Loops", url: "For-Each-Loops", parent_id: 1},
])

Tutorial.create([
    { name: "Scanners", url: "while-loops", parent_id: 2},
    { name: "Scanner Pt.2", url: "while-loops", parent_id: 2},
    { name: "Scanners Pt. 3", url: "while-loops", parent_id: 2},
])

