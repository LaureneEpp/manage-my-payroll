class Payslip < ApplicationRecord
  belongs_to :employee
  has_many :payslip_allowances
  has_many :allowances, through: :payslip_allowances
  has_many :payslip_deductions
  has_many :deductions, through: :payslip_deductions
end
