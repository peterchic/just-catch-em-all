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
      # pokemon_list_array = ["Bulbasaur","Ivysaur","Venusaur","Charmander","Charmeleon","Charizard","Squirtle","Wartortle","Blastoise","Caterpie","Metapod","Butterfree","Weedle","Kakuna","Beedrill","Pidgey","Pidgeotto","Pidgeot","Rattata","Raticate","Spearow","Fearow","Ekans","Arbok","Pikachu","Raichu","Sandshrew","Sandslash","Nidoran","Nidorina","Nidoqueen","Nidoran","Nidorino","Nidoking","Clefairy","Clefable","Vulpix","Ninetales","Jigglypuff","Wigglytuff","Zubat","Golbat","Oddish","Gloom","Vileplume","Paras","Parasect","Venonat","Venomoth","Diglett","Dugtrio","Meowth","Persian","Psyduck","Golduck","Mankey","Primeape","Growlithe","Arcanine","Poliwag","Poliwhirl","Poliwrath","Abra","Kadabra","Alakazam","Machop","Machoke","Machamp","Bellsprout","Weepinbell","Victreebel","Tentacool","Tentacruel","Geodude","Graveler","Golem","Ponyta","Rapidash","Slowpoke","Slowbro","Magnemite","Magneton","Farfetch'd","Doduo","Dodrio","Seel","Dewgong","Grimer","Muk","Shellder","Cloyster","Gastly","Haunter"

      # "Gengar","Onix","Drowzee","Hypno","Krabby","Kingler","Voltorb","Electrode","Exeggcute","Exeggutor","Cubone","Marowak","Hitmonlee","Hitmonchan","Lickitung","Koffing","Weezing","Rhyhorn","Rhydon","Chansey","Tangela","Kangaskhan","Horsea","Seadra","Goldeen","Seaking","Staryu","Starmie","Mr.Mime","Scyther","Jynx","Electabuzz","Magmar","Pinsir","Tauros","Magikarp","Gyarados","Lapras","Ditto","Eevee","Vaporeon","Jolteon","Flareon","Porygon","Omanyte","Omastar","Kabuto","Kabutops","Aerodactyl","Snorlax","Articuno","Zapdos","Moltres","Dratini","Dragonair","Dragonite","Mewtwo","Mew"]

      # if pokemon_name
      #   pokemon_list_array.each do |pokemon|
      #     # binding.pry
      #     pokemon.select(pokemon_name)
      #   "We can't find that pokemon. Please enter all pokemon name."
      #   end
      # else
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


        You have " + "#{Pokemon.all.length}" + " pokémon in the sweet database. Sweet!"
        result
      # end
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
