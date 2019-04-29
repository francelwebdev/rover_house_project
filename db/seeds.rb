# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.delete_all
roles = ["Propriétaire", "Agence", "Admin"].sort
roles.each do |role|
    Role.create(name: role)
end

# Category.delete_all
# category_types = ["A louer", "A vendre"].sort
# category_types.each do |category_type|
#     Category.create(name: category_type)
# end