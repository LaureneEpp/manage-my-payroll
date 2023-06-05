class Payslip < ApplicationRecord
  belongs_to :employee
  has_many :allowances
  has_many :deductions
end
