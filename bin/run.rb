require_relative '../config/environment.rb'

cli = CommandLineInterface.new
art = Art.new

art.welcome  #<< Welcome Screen
sleep(2)
art.poke_animation #<< Pokeball
sleep(2)
#1 Ask user for Name and stores in variable
user_name = cli.enter_name
#2 Initiates search and returns name or number to be used in API
pokemon = cli.user_search
