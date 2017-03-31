require 'json'
require 'pry'
require 'httparty'

  class ApiCommunicator

    URL = "http://pokeapi.co/api/v2/pokemon"

    attr_reader :user

    def initialize(user)
      @user = user
    end

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
        pokemon = Pokemon.find_or_create_by(name: name, poke_type: poke_type, base_xp: base_xp)
        PokemonUser.create(pokemon_id: pokemon.id, user_id: self.user.id)
        # pokemon.users << current_user
        # pokemon.save
        # Pokemon.find_or_create_by(poke_type: poke_type)
        # Pokemon.find_or_create_by(base_xp: base_xp)
        puts "


        You have #{Pokemon.all.length} Pokémon in this database! Sa-weet!"
        result
    end


  end
