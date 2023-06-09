class Deduction < ApplicationRecord
    # belongs_to :payslip
    has_many :payslip_deductions, dependent: :destroy
    has_many :payslips, through: :payslip_deductions
end
