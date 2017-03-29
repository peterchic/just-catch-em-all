class ChangeColumnTypeForExperience < ActiveRecord::Migration[5.0]
  def change
    change_column :pokemons, :base_xp, :integer
  end
end
