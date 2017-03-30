class Pokemon < ActiveRecord::Base
  has_many :pokemon_users
  has_many :users, through: :pokemon_users
end
