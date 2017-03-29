class User < ActiveRecord::Base
  has_many :pokemons through: :pokemon_users
end
