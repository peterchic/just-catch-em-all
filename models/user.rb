class User < ActiveRecord::Base
  has_many :pokemons, through: :pokemonuser

  def self.new_user(name)
    self.find_or_create_by(:name, name)
  end

end
