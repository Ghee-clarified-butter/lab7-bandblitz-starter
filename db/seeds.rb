# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

adminGenre = Genre.new
adminGenre.name = "Admin Genre"
adminGenre.save!
adminBand = Band.new
adminBand.name = "Admin Band"
adminBand.description = "An initial band to create users"
adminBand.genre_ids = [adminGenre.id]
adminBand.save!
admin = User.new
admin.first_name = "Admin"
admin.last_name = "Admin"
admin.email = "admin@example.com"
admin.band_id = adminBand.id
admin.password = "secret"
admin.password_confirmation = "secret"
admin.role = 3
admin.save!
