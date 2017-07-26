require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'
require_relative 'models/team'
require_relative 'models/pokemon'
require_relative 'models/trainer'

get '/' do
  erb :"/index"
end

get '/pokemons' do
  @pokemons = Pokemon.all
  erb :"/pokemons/index"
end

get '/trainers' do
  @trainers = Trainer.all
  erb :"/trainers/index"
end

get '/teams' do
  @teams = Team.all
  erb :"/teams/index"
end

get '/pokemons/new' do
  @trainers = Trainer.all
  erb :"/pokemons/new"
end

get '/trainers/new' do
  erb :"/trainers/new"
end

post '/pokemons' do
  @pokemon = Pokemon.create(params[:pokemon])
  redirect "/pokemons/#{@pokemon.id}"
end

post '/trainers' do
  @trainer = Trainer.create(params[:trainer])
  redirect "/trainers/#{@trainer.id}"
end

get '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :"/pokemons/profile"
end

get '/trainers/:id' do
  @teams = Team.all
  @trainer = Trainer.find(params[:id])
  erb :"/trainers/profile"
end

get '/teams/:id' do
  @trainers = Trainer.all
  @team = Team.find(params[:id])
  erb :"/teams/profile"
end

get '/pokemons/:id/edit' do
  @trainers = Trainer.all
  @pokemon = Pokemon.find(params[:id])
  erb :'/pokemons/edit'
end

get '/trainers/:id/edit' do
  @teams = Team.all
  @trainer = Trainer.find(params[:id])
  erb :'/trainers/edit'
end

put '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect "/pokemons/#{@pokemon.id}"
end

put '/trainers/:id' do
  @trainer = Trainer.find(params[:id])
  @trainer.update(params[:trainer])
  redirect "/trainers/#{@trainer.id}"
end

delete '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect '/pokemons'
end

delete '/trainers/:id' do
  @trainer = Trainer.find(params[:id])
  @trainer.destroy
  redirect '/trainers'
end
