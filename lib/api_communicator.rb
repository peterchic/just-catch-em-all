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

      result["name"] = api_info["name"]
      result["type"] = api_info["types"][0]["type"]["name"]
      result["base_xp"] = api_info["base_experience"]

      result = "#{pokemon_name.capitalize} is a type of #{result["type"]} pokemon with a base experience of #{result["base_xp"]}!"
      # {"name"=>"pikachu", "type"=>"electric", "base_xp"=>112}
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
