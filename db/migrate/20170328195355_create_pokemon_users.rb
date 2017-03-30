class CreatePokemonUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemon_users do |t|
      t.integer :user_id
      t.integer :pokemon_id
    end
  end
end
