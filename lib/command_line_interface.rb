# require 'rest-client'
require 'json'
require 'pry'

class CommandLineInterface
  def welcome
    puts "Welcome to the Pokemon API browser."
  end

  def get_pokemon_name_from_user
    puts "Please enter a pokemon name"
    gets.chomp.downcase
  end

  def give_stats_to_user(response)
    api = ApiCommunicator.new
    puts api.poke_info(response)
  end
end
