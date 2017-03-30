class User < ActiveRecord::Base
  has_many :pokemon_users
  has_many :pokemons, through: :pokemon_users

  # def self.new_user(name)
  #   self.find_or_create_by(name: name)
  # end
end
