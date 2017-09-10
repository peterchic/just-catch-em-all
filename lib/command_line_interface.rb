# require 'rest-client'
require 'json'
require 'pry'
require_relative '../models/user.rb'

class CommandLineInterface
  attr_accessor :user

  def enter_name
    puts "*** Please enter your name ***"
    user_name = gets.strip.downcase

    puts "Thanks #{user_name.capitalize}! You're looking pretty good today!"
    self.user = User.find_or_create_by(name: user_name)
  end

  def user_search
    puts "Now let's look for some Pokémon! Type in a name of your favorite Pokémon. Or try typing in a number between 1 and 721 and see what you find."
    pokemon = gets.strip.downcase
    give_stats_to_user(pokemon)
  end

  def give_stats_to_user(response)
    api = ApiCommunicator.new(self.user)
    puts api.poke_info(response)
    sleep(4)
    puts "Nice Catch!"
    give_options_to_user
  end

  def give_options_to_user
      puts "What do you want to do next? Type in number from the options below!"
      puts "1. Search for a new pokemon! I'm addicted!"
      puts "2. View a list of pokemons that you typed in."
      puts "3. Exit the Pokemon API Browser"
      puts "4. Get a programming joke then exit."
      user_option = gets.chomp

      if user_option == "1"
        user_search
      elsif user_option == "2"
        list_users_pokemon
      elsif user_option == "3"
        goodbye_user
      else user_option == "4"
        exit_joke
      end
  end

  def list_users_pokemon
    self.user.pokemons.uniq.each do |pokemon_instance|
      puts pokemon_instance.name
    end
    give_options_to_user
  end

  def exit_joke
    puts "What's the object-oriented way to become wealthy?"
    sleep(2)
    puts "Inheritance. Badum che!"
    sleep(3)
    goodbye_user
  end

  def goodbye_user
    puts "Good bye! See you next time trainer!"
    sleep(2)
    system("open https://www.youtube.com/watch?v=JuYeHPFR3f0")
  end

end
