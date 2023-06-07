class CreatePayslipDeductions < ActiveRecord::Migration[7.0]
  def change
    create_table :payslip_deductions do |t|
      t.references :deduction, null: false, foreign_key: true
      t.references :payslip, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
