class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :city
      t.string :country
      t.boolean :manager
      t.references :team, null: false, foreign_key: true
      t.references :position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
