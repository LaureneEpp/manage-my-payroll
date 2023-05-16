class CreatePayslips < ActiveRecord::Migration[7.0]
  def change
    create_table :payslips do |t|
      t.integer :present
      t.references :employee, null: false, foreign_key: true
      t.integer :absent
      t.integer :salary
      t.integer :allowance_amount
      t.integer :deduction_amount
      t.integer :net

      t.timestamps
    end
  end
end
