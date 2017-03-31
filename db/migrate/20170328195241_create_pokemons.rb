class CreatePokemons < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :poke_type
      t.integer :base_xp
    end
  end
end
