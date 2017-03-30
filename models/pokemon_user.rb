class PokemonUser < ActiveRecord::Base
  belongs_to :pokemons
  belongs_to :users


end
