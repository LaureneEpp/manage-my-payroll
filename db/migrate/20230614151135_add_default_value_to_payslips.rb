class AddDefaultValueToPayslips < ActiveRecord::Migration[7.0]
  def up
    change_column_default :payslips, :allowance_amount, "0"
    change_column_default :payslips, :deduction_amount, "0"
  end
end
