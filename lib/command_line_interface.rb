# require 'rest-client'
require 'json'
require 'pry'
require_relative '../models/user.rb'

class CommandLineInterface
  # attr_reader :user_name
  #
  # def initialize
  #   @user_name = user_name
  # end

  def welcome
    puts "Welcome to the Pokemon API browser."
  end

  def enter_name
    puts "Please enter your name."
    user_name = gets.strip.downcase
    #binding.pry
    User.new(name: user_name)
  end

  # def new_user(user_name)
  #   # user = User.find_or_create_by(name: user_name)
  #   User.new(name: user_name)
  # end

  def get_pokemon_name_from_user
    puts "Thanks! Now lets look for some Pokemon!
Type in a name of your favorite Pokemon.
Hint: Try typing in a number between
1 and 721 and see what you find."
    gets.strip.downcase
  end

  def give_stats_to_user(response)
    api = ApiCommunicator.new
    puts api.poke_info(response)
  end
end
