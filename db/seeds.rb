# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
while Category.count < 10
    #Solo se agregara a la base de datos una categoria que no exista, sino sera filtrada por el if
    if !Category.pluck(:name).include?(Faker::Game.genre)
        unique_name = Faker::Game.genre
        Category.create(name: unique_name)
    end
end