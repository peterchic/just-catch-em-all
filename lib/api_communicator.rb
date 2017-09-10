require 'json'
require 'pry'
require 'httparty'

class ApiCommunicator
  attr_reader :user
  URL = "http://pokeapi.co/api/v2/pokemon"

  def initialize(user)
    @user = user
  end

  def poke_info(pokemon_name)
    result = {}
    api_info = self.get_pokemons(pokemon_name)
      # {"name"=>"pikachu", "type"=>"electric", "base_xp"=>112}
      name = api_info["name"]
      poke_type = api_info["types"][0]["type"]["name"]
      base_xp = api_info["base_experience"]
      result = "#{name.capitalize} is a type of #{poke_type} pokémon with a base experience of #{base_xp}!"

    pokemon = Pokemon.find_or_create_by(name: name, poke_type: poke_type, base_xp: base_xp)
    PokemonUser.create(pokemon_id: pokemon.id, user_id: self.user.id)
    puts "You have #{Pokemon.all.length} Pokémon in this database! Sa-weet!"
    result

  end

  def get_pokemons(pokemon_name)
    response = HTTParty.get("#{URL}/#{pokemon_name}")
    JSON.parse(response.body)
  end

end
