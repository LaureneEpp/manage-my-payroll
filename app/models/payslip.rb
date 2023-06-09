class Payslip < ApplicationRecord
  belongs_to :employee
  has_many :payslip_allowances, dependent: :destroy
  has_many :allowances, through: :payslip_allowances
  has_many :payslip_deductions, dependent: :destroy
  has_many :deductions, through: :payslip_deductions
end
