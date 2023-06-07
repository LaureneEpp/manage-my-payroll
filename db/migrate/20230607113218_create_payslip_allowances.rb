class CreatePayslipAllowances < ActiveRecord::Migration[7.0]
  def change
    create_table :payslip_allowances do |t|
      t.references :allowance, null: false, foreign_key: true
      t.references :payslip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
