# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(:email => 'a@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret')
User.create!(:email => 'b@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret')
User.create!(:email => 'c@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret')
User.create!(:email => 'd@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret')

Voiture.create!(:marque => 'Toyota', :couleur => 'Bleu',   :annee => 2004)
Voiture.create!(:marque => 'Toyota', :couleur => 'Vert',   :annee => 2012)
Voiture.create!(:marque => 'Ford',   :couleur => 'Rouge',  :annee => 2008, :user_id => User.first.id)
Voiture.create!(:marque => 'Honda',  :couleur => 'Blanc',  :annee => 2010)
Voiture.create!(:marque => 'Ford',   :couleur => 'Bleu',   :annee => 2011, :user_id => User.first.id)
