# require 'rest-client'
require 'json'
require 'pry'
require_relative '../models/user.rb'


class CommandLineInterface

  attr_accessor :user

  def welcome
    puts"########################################"
    puts"#                                      #"
    puts"#                                      #"
    puts"#    ▓▓     Welcome to Our      ▓▓     #"
    puts"#    ▓▓   Pokémon API Browser   ▓▓     #"
    puts"#                                      #"
    puts"#                                      #"
    puts"########################################"
  end

  def enter_name
    puts "
     *** Please enter your name ***"
    user_name = gets.strip.downcase
    puts "

Thanks #{user_name.capitalize}!
You're looking pretty good today!

    "

    self.user = User.find_or_create_by(name: user_name)
  end

  def get_pokemon_name_from_user
    # sleep(2)
    puts "


    Now let's look for some Pokémon!


    Type in a name of your favorite Pokémon.
    Or try typing in a number between 1 and 721 and see what you find.

"
    gets.strip.downcase
  end

  def more_pokemon?
    # sleep(2)
    puts "Now lets look for some Pokémon!

    Type in a name of your favorite Pokémon.
    Or try typing in a number between 1 and 721 and see what you find.

"
    gets.strip.downcase
    give_stats_to_user(response)
  end

  def give_stats_to_user(response)
    api = ApiCommunicator.new(self.user)
    puts api.poke_info(response)
    sleep(2)

    give_options_to_user
  end

  # def view_catched_pokemon_by_user
  #   puts "Would you like to see your list, trainor #{user_name}?"
  # end

  def give_options_to_user
      puts "Great find! What do you want to do next? Type in number."
      puts "1. Search for a new pokemon by name"
      puts "2. View a list of pokemons that you typed in."
      puts "3. Exit the Pokemon API Browser"
      puts "4. Get a programming joke."

      user_option = gets.chomp

      if user_option == "1"
        more_pokemon?
      elsif user_option == "2"
        list_users_pokemon
      elsif user_option == "3"
        goodbye_user
      else user_option == "4"
        puts "What's the object-oriented way to become wealthy?"
        sleep(2)
        puts "Inheritance. Badum che!"
      end

    puts "Great find! Would you like to search again? Type in another pokemon name."
    response_two = gets.chomp.downcase
    until response_two == "no" || response_two == "exit!"  || response_two == "quit"  || response_two == "q" do
      give_stats_to_user(response_two)
    end
    puts "Good bye! See you next time trainer!"
    system("open https://www.youtube.com/watch?v=JuYeHPFR3f0")
  end

  def goodbye_user
    puts "Good bye! See you next time trainer!"
    system("open https://www.youtube.com/watch?v=JuYeHPFR3f0")
  end

  def list_users_pokemon
    # binding.pry
    self.user.pokemons.uniq.each do |pokemon_instance|
      puts pokemon_instance.name
    end
  end

  def artwork1
    puts"$                                      $"
    sleep(4.0/24.0)
    puts"$                                      $"
    sleep(4.0/24.0)
    puts"$                 ãããã                 $"
    sleep(4.0/24.0)
    puts"$             @@@@@@@@@@@@             $"
    sleep(4.0/24.0)
    puts"$           @@@@@@@@@@@@@@@@           $"
    sleep(4.0/24.0)
    puts"$         @@@@@@@@@@@@@@@@@@@@         $"
    sleep(4.0/24.0)
    puts"$        @@@@@@@@@@@@@@@@@@@@@@        $"
    sleep(4.0/24.0)
    puts"$       @@@@@@@@@┌ -- ┐@@@@@@@@@       $"
    sleep(4.0/24.0)
    puts"$       ████████| |██| |████████       $"
    sleep(4.0/24.0)
    puts"$       @        └ __ ┘        @       $"
    sleep(4.0/24.0)
    puts"$        @                    @        $"
    sleep(4.0/24.0)
    puts"$         @                  @         $"
    sleep(4.0/24.0)
    puts"$           @              @           $"
    sleep(4.0/24.0)
    puts"$              @        @              $"
    sleep(4.0/24.0)
    puts"$_________________©©©©_________________$"
    sleep(9.0/24.0)
    #system("clear")
  end


end
