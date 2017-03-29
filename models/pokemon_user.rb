class Pokemon_user < ActiveRecord::Base
  has_many :pokemons
  has_many :users
end
