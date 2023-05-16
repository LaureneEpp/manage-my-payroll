class CreatePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.string :name
      t.boolean :manager

      t.timestamps
    end
  end
end
