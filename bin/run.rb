require_relative '../config/environment.rb'

# require_relative "../lib/command_line_interface.rb"
# require_relative "../lib/api_communicator.rb"

cli = CommandLineInterface.new


cli.welcome  #<< Welcome Screen
sleep(2)
cli.artwork1 #<< Pokeball
sleep(2)
user_name = cli.enter_name #<<Users name
# cli.new_user(user_name)
pokemon = cli.get_pokemon_name_from_user #<< Receive Pokemon name or number
cli.give_stats_to_user(pokemon) #<< Hits API for pokemon info

cli.view_catched_pokemon_by_user #=> Asks user if they wants to see their list
