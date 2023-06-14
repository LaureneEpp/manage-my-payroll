class Payslip < ApplicationRecord
  belongs_to :employee
  has_many :payslip_allowances, dependent: :destroy
  has_many :allowances, through: :payslip_allowances
  has_many :payslip_deductions, dependent: :destroy
  has_many :deductions, through: :payslip_deductions

  def calculate_allowances_amount
    self.allowances.sum(:amount)
  end

  def calculate_deductions_amount
    self.deductions.sum(:amount)
  end
end

