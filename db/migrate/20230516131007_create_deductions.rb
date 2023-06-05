class CreateDeductions < ActiveRecord::Migration[7.0]
  def change
    create_table :deductions do |t|
      t.string :name
      t.string :description
      t.integer :amount

      t.timestamps
    end
  end
end
