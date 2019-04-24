# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PropertyType.delete_all
property_types = ["Appartement", "Immeuble", "Terrain", "Suite", "Motel", "Hôtel", "Maison", "Villa", "Parcelle", "Domaine", "Bureau", "Boutique / Local Commercial", "Immeuble"].sort
property_types.each do |pt|
PropertyType.create(name: pt)
end

AdType.delete_all
ad_types = ["Location", "Vente"].sort
ad_types.each do |pt|
AdType.create(name: pt)
end

Country.delete_all
countries = ["Bénin", "Togo", "Gabon", "Cameroun", "Burkina Faso", "Niger", "Côte d’Ivoire"].sort
countries.each do |ct|
    Country.create(name: ct)
end

# Room.delete_all
# rooms = ["1 pièce", "2 pièces", "3 pièces", "4 pièces", "5 pièces et +"].sort
# rooms.each do |room|
#     Room.create()
# end

Role.delete_all
roles = ["Particulier", "Profesionnel"].sort
roles.each do |role|
    Role.create(name: role)
end
