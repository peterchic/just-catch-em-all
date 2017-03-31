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


    Now lets look for some Pokémon!


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
  end

  def give_stats_to_user(response)
    api = ApiCommunicator.new(self.user)
    puts api.poke_info(response)
    sleep(2)

    ask_user_to_search_again
  end

  def ask_user_to_search_again
    puts "Great find! Would you like to search again? Type in another pokemon name."
    response_two = gets.chomp.downcase
    until response_two == "no" || response_two == "exit!"  || response_two == "quit"  || response_two == "q" do
      give_stats_to_user(response_two)
    end
    puts "Good bye! See you next time trainer!"
    system("open https://www.youtube.com/watch?v=JuYeHPFR3f0")
  end

  def artwork1

    puts"$                                      $"
    # sleep(4.0/24.0)
    puts"$                                      $"
    # sleep(4.0/24.0)
    puts"$                 ãããã                 $"
    # sleep(4.0/24.0)
    puts"$             @@@@@@@@@@@@             $"
    # sleep(4.0/24.0)
    puts"$           @@@@@@@@@@@@@@@@           $"
    # sleep(4.0/24.0)
    puts"$         @@@@@@@@@@@@@@@@@@@@         $"
    # sleep(4.0/24.0)
    puts"$        @@@@@@@@@@@@@@@@@@@@@@        $"
    # sleep(4.0/24.0)
    puts"$       @@@@@@@@@┌ -- ┐@@@@@@@@@       $"
    # sleep(4.0/24.0)
    puts"$       ████████| |██| |████████       $"
    # sleep(4.0/24.0)
    puts"$       @        └ __ ┘        @       $"
    # sleep(4.0/24.0)
    puts"$        @                    @        $"
    # sleep(4.0/24.0)
    puts"$         @                  @         $"
    # sleep(4.0/24.0)
    puts"$           @              @           $"
    # sleep(4.0/24.0)
    puts"$              @        @              $"
    # sleep(4.0/24.0)
    puts"$_________________©©©©_________________$"
    sleep(9.0/24.0)
    system("clear")
  end


end
