require_relative '../config/environment.rb'

require_relative "../lib/command_line_interface.rb"
require_relative "../lib/api_communicator.rb"

welcome
pokemon = get_pokemon_name_from_user
poke_info(pokemon)
