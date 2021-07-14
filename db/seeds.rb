# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{ name: 'Clothing' }, { name: 'Hardware' }, { name: 'Entertainment' }, { name: 'Essentials' },{ name: 'Jewelry' }, { name: 'Technology' } ])

User.create(email: 'SolBadGuy@gmail.com', first_name: 'Sol', last_name: 'BadGuy', password: '1234', balance: 100, address: 'The Backyard', vendor: false)
User.create(email: 'KyKiske@gmail.com', first_name: 'Ky', last_name: 'Kiske', password: '1234', balance: 100, address: 'Ilyria', vendor: true)
User.create(email: 'LeoWhitefang@gmail.com', first_name: 'Leo', last_name: 'Whitefang', password: '1234', balance: 100, address: 'Ilyria', vendor: false)
User.create(email: 'JamKuradoberi@gmail.com', first_name: 'Jam', last_name: 'Kuradoberi', password: '1234', balance: 100, address: 'China', vendor: true)
User.create(email: 'MilliaRage@gmail.com', first_name: 'Millia', last_name: 'Rage', password: '1234', balance: 100, address: 'The Backyard', vendor: true)


Storefront.create(name: 'V-Necks Galore', description: 'Onestop shop for all your V-neck needs', owner_id: 2)
Storefront.create(name: 'Puffball Restaurant', description: 'Dumplings, Porkbuns, and IAD JH', owner_id: 4)
Storefront.create(name: 'Rage Hair Supplies', description: 'For strong, top tier hair. No one will know what hit them. ', owner_id: 5)