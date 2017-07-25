require 'active_record'
require 'ffaker'
require 'pg'
require_relative 'connection'
require_relative '../models/pokemon'
require_relative '../models/trainer'


Trainer.destroy_all
liz = Trainer.create(name: "Liz", level: rand(100), img_url: "https://s-media-cache-ak0.pinimg.com/736x/a1/94/52/a19452254465efaa66c73c26ea643b73--real-pokemon-pokemon-fan.jpg")
ash = Trainer.create(name: "Ash", level: rand(100), img_url: "http://s3.amazonaws.com/uploads.kidzworld.com/article/35277/poke1.jpg")
charlie = Trainer.create(name: "Charlie", level: rand(100), img_url: "https://s-media-cache-ak0.pinimg.com/originals/41/fb/44/41fb449a781283d2a511209ade9cf7dd.jpg")

Pokemon.destroy_all
Pokemon.create(name: "Charmander", cp: rand(800), poke_type: "fire", img_url: "https://img.pokemondb.net/artwork/charmander.jpg", trainer: liz)
Pokemon.create(name: "Squirtle", cp: rand(800), poke_type: "water", img_url: "https://img.pokemondb.net/artwork/squirtle.jpg", trainer: liz)
Pokemon.create(name: "Pikachu", cp: rand(800), poke_type: "lightning", img_url: "https://img.pokemondb.net/artwork/pikachu.jpg", trainer: liz)
Pokemon.create(name: "Bulbasaur", cp: rand(800), poke_type: "grass", img_url: "https://img.pokemondb.net/artwork/bulbasaur.jpg", trainer: ash)
Pokemon.create(name: "Clefairy", cp: rand(800), poke_type: "fairy", img_url: "https://img.pokemondb.net/artwork/clefairy.jpg", trainer: ash)
Pokemon.create(name: "Nidoking", cp: rand(800), poke_type: "poison ground", img_url: "https://img.pokemondb.net/artwork/nidoking.jpg", trainer: charlie)
Pokemon.create(name: "Gengar", cp: rand(800), poke_type: "ghost poison", img_url: "https://img.pokemondb.net/artwork/gengar.jpg", trainer: charlie)
Pokemon.create(name: "Blastoise", cp: rand(800), poke_type: "water", img_url: "https://img.pokemondb.net/artwork/blastoise.jpg", trainer: charlie)
