class AddRefToTeams < ActiveRecord::Migration[7.0]
  def change
    add_reference :teams, :departement, null: false, foreign_key: true
  end
end
