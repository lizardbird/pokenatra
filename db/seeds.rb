require 'active_record'
require 'ffaker'
require 'pokemon_faker'
require 'faker'
require 'pg'
require_relative 'connection'
require_relative '../models/team'
require_relative '../models/trainer'
require_relative '../models/pokemon'



Team.destroy_all
Trainer.destroy_all
Pokemon.destroy_all



trainer_images_female = [
  "http://pre10.deviantart.net/b9f1/th/pre/f/2013/300/e/e/azami___pokemon_trainer_oc_by_yukidemon-d6s2oby.png",
  "https://pokecharms.com/data/attachment-files/2015/10/233810_Pokemon_OC.png",
"http://vignette3.wikia.nocookie.net/pokemon/images/8/8e/Black_and_White_Trainer_Girl.png/revision/latest?cb=20160116123556",
  "http://orig08.deviantart.net/7671/f/2016/192/a/1/pokemon_trainer_jordy_by_ravenide-da9m0mx.png"
  ]

trainer_images_male = ["http://vignette1.wikia.nocookie.net/nintendo/images/0/0f/Ethan.png/revision/latest?cb=20111124133921&path-prefix=en",
  "http://images5.fanpop.com/image/photos/27700000/eric-pokemon-trainer-rp-27725266-689-1158.png",
"https://vignette3.wikia.nocookie.net/pokemon/images/5/56/Red_%28game%29.png/revision/latest?cb=20090815115503",
  "http://orig15.deviantart.net/b3b7/f/2011/003/f/e/pokemon_trainer_denny_by_tsunami_dono-d36cgr5.png",
  "http://orig03.deviantart.net/5f91/f/2013/354/4/8/me_as_a_pokemon_trainer_by_superbarrio-d6ynkl8.png"
]

team_names = ["Mystic", "Valor", "Instinct", "Tribute"]
team_colors = ["blue", "red", "silver", "yellow"]
team_images = ["https://jackaloupe.files.wordpress.com/2016/07/team-mystic-cutout1.png",
  "https://jackaloupe.files.wordpress.com/2016/07/team-valor-cutout1.png",
  "https://jackaloupe.files.wordpress.com/2016/07/team-instinct-cutout.png"
]

def createTeam (name, color, img)
  team = Team.create(name:name, color: color, img_url: img)
  return team
end

def createTrainer (team, name, img)
  trainer = Trainer.create(name: name, img_url: img , level: rand(100), team: team)
  return trainer
end

def createPokemon (trainer)
    poke_pair = PokemonFaker.match
    poke_move = Faker::Pokemon.move
    pokemon = Pokemon.create(name: poke_pair[0], cp: rand(800), img_url: poke_pair[1], move: poke_move, trainer: trainer)
    return pokemon
  end

3.times do |i|
  name = team_names[i]
  color = team_colors[i]
  img = team_images[i]
  team = createTeam(name, color,img)
  2.times do |i|
    name = FFaker::Name.first_name_female
    img = trainer_images_female[i]
    trainer = createTrainer(team, name, img)
      3.times do
        createPokemon(trainer)
      end
  end
  2.times do |i|
    name = FFaker::Name.first_name_male
    img = trainer_images_male[i]
    trainer = createTrainer(team, name, img)
      3.times do
        createPokemon(trainer)
      end
  end
end


# i = 0
# 4.times do
#   name = FFaker::Name.first_name_male
#   img = trainer_images_male[i]
#   team = trainer_teams.sample
#   trainer = createTrainer(name, img, team)
#   5.times do
#     createPokemon(trainer)
#   end
#   i += 1
# end
