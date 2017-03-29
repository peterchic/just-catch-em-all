require_relative 'config/environment'

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
pokemon = get_pokemon_name_from_user
show_pokemon_details(pokemon)
