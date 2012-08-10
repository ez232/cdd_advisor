# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rake db:seed (or
# created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Shape.delete_all
Shape.create(name: "Organic")
Shape.create(name: "Rectangle")
Shape.create(name: "Square")
Shape.create(name: "Trapezium")
Shape.create(name: "Trapezoid")
Shape.create(name: "Cylindrical")
Shape.create(name: "Oval")
Shape.create(name: "Spherical")
Shape.create(name: "Conical")
Shape.create(name: "Triangle")