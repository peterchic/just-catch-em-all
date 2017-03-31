require 'json'
require 'pry'
require 'httparty'

  class ApiCommunicator
    URL = "http://pokeapi.co/api/v2/pokemon"

    def get_pokemons(pokemon_name)
      # uri = URI.parse(URL)
      # response = Net::HTTP.get_response(uri)
      response = HTTParty.get("#{URL}/#{pokemon_name}")
      JSON.parse(response.body)
    end

    def poke_info(pokemon_name)
      api_info = self.get_pokemons(pokemon_name)
      result = {}

      name = api_info["name"]
      poke_type = api_info["types"][0]["type"]["name"]
      base_xp = api_info["base_experience"]

      result = "

#{name.capitalize} is a type of #{poke_type} pokémon with a base experience of #{base_xp}!"
      # {"name"=>"pikachu", "type"=>"electric", "base_xp"=>112}
      # binding.pry
      Pokemon.find_or_create_by(name: name)
      # Pokemon.find_or_create_by(poke_type: type)
      # Pokemon.find_or_create_by(base_xp: base_xp)
      puts "number of pkmn in db " + "#{Pokemon.all.length}"
      result
    end
  end



# response = RestClient.get("https://phalt-pokeapi.p.mashape.com/pokemon",
#   {
#     "X-Mashape-Key" => "lC9qQhTl1tmshbvcCkjNA3b3WgEmp1OqHEzjsnEX23DqhR8FNa",
#     "Accept" => "application/json"
#   }
# )

# binding.pry
# "hi"
