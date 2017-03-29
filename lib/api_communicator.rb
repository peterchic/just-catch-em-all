# require 'rest-client'
require 'json'
require 'pry'
require 'httparty'

  class GetPokemons

    # URL = "https://phalt-pokeapi.p.mashape.com/pokemon"
    URL = "http://pokeapi.co/api/v2/pokemon"

    def get_pokemons(pokemon_name)
      # uri = URI.parse(URL)
      # response = Net::HTTP.get_response(uri)
      response = HTTParty.get("#{URL}/#{pokemon_name}")
      binding.pry
      JSON.parse(response.body)
    end

    def pokemon #?
      #using the JSON library to parse the API response in a nice format JSON
      #pokemons - hash
      pokemons = JSON.parse(self.get_pokemons)
      pokemons['results'].collect do |pokemon_name|
        #iterate through to get me the pokemon name
        pokemon_name
      end
    end
  end

  pokemons = GetPokemons.new
  puts pokemons.pokemon.uniq

# response = RestClient.get("https://phalt-pokeapi.p.mashape.com/pokemon",
#   {
#     "X-Mashape-Key" => "lC9qQhTl1tmshbvcCkjNA3b3WgEmp1OqHEzjsnEX23DqhR8FNa",
#     "Accept" => "application/json"
#   }
# )

binding.pry
"hi"
