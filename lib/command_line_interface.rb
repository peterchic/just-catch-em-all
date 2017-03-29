# require 'rest-client'
require 'json'
require 'pry'

def welcome
  "Welcome to the Pokemon API browser."
end

def get_pokemon_name_from_user
  "Please enter a pokemon name"
  response = gets.chomp.downcase
end

def give_stats_to_user(response)
  api.poke_info(response)
end
