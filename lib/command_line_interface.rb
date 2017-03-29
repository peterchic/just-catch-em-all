require 'rest-client'
require 'json'
require 'pry'

def welcome
  puts "Welcome to the Pokemon API browser."
end

def get_pokemon_name_from_user
  puts "Please enter a pokemon name"
  response = gets.chomp.downcase
end

binding.pry
"hi"
