# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.delete_all
Category.delete_all
Order.delete_all
User.delete_all

user1 = User.create!(username: "KillaCam", password: "password")
user2 = User.create!(username: "Admin", password: "adminpassword", role: 1)
user3 = User.create!(username: "Alex", password: "password")

category1 = Category.create!(name: "Jedi Padawan")
category2 = Category.create!(name: "Jedi Master")
category3 = Category.create!(name: "Sith Apprentice")
category4 = Category.create!(name: "Sith Lord")

item1 = Item.create!(name: "Obi-Wan Kenobi's Lightsaber", description: "Obi-Wan Kenobi's lightsaber was the third lightsaber that was constructed and wielded by Jedi Master Obi-Wan Kenobi during the Clone Wars after he lost his second one prior to the Battle of Geonosis. He would eventually use this lightsaber to duel his fallen apprentice Darth Vader on Mustafar, and would continue to wield the weapon during his 19-year exile on Tatooine up until his death at the hands of Vader during their rematch on the Death Star. Obi-Wan's second apprentice Luke Skywalker would later use this weapon's design as a basis for the construction of his second lightsaber.", price: 300.0, image: "https://vignette.wikia.nocookie.net/starwars/images/d/d5/KenobiEpIIISaber-MR.jpg/revision/latest?cb=20100618033432", status: "retired", category: category2)
item2 = Item.create!(name: "Exar Kun's Lightsaber", description: "The lightsaber of Jedi Knight Exar Kun was a device that was initially created to produce a single beam of blue-white energy. However, upon his ascension to Dark Lord of the Sith, Kun redesigned his lightsaber based on instructions hidden within an antiquated Sith holocron. The finished product was a double-bladed weapon imbued with dark side energy, from which sapphire blades materialized up to 1.5 meters from either end of the hilt.", price: 400.0, image: "https://vignette.wikia.nocookie.net/starwars/images/1/11/Kun%27s_Lightsaber.jpg/revision/latest?cb=20080814035831", status: "active", category: category4)
item3 = Item.create!(name: "Darth Maul's Lightsaber", description: "Maul used the saberstaff on countless missions for his master, Darth Sidious. With it he embarked on missions to kill Jedi and to eliminate enemies. Maul used the saberstaff to eliminate Jedi Anoon Bondara, Siolo Ur Manka, Qui-Gon Jinn and Darsha Assant. He used the lightsaber in his mission to cripple the Black Sun criminal syndicate.", image: "https://s3.envato.com/files/184762216/Preview%20Image%20Set/DMLS%202.jpg", price: 250.0, category: category3, status: "active")
item4 = Item.create!(name: "Mace Windu's Lightsaber", description: "One of the most distinctive lightsabers in the Jedi Order due to its amethyst plasma blade, Windu would carry this weapon into battle on multiple occasions during the Clone Wars in which he served as a Jedi General in the Grand Army of the Republic. The lightsaber was ultimately lost during a confrontation between Windu and the Sith Lord Darth Sidious, who then killed the Jedi Order's champion through the use of Force lightning.", price: 700, image: "https://pm1.narvii.com/6214/1f2e654d21fa99e5ec4db0dec13ee89b9fe8441a_hq.jpg", status: "retired", category: category2)
item5 = Item.create!(name: "Training Lightsaber", description: "Training lightsabers were most often used by Jedi younglings before they underwent the Gathering and built a weapon of their own. It was also possible for normal lightsabers to be tuned down so they could be used in this fashion.", price: 100, image: "http://www.l-ateliergourmand.com/thumbnail/r/ro-lightsabers-anakin-padawan-lightsaber-2.jpeg", category: category1, status: "active")

order1 = Order.create(status: "complete", total_price: 100.00, address: "123 Turing Way", created_at: Date.today, updated_at: Date.today, user: user1)
order2 = Order.create(status: "pending", total_price: 500.00, address: "123 Turing Way", created_at: Date.today, updated_at: Date.today, user: user1)

puts "Seed complete!"
