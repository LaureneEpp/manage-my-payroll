class Allowance < ApplicationRecord
    # belongs_to :payslip
    has_many :payslip_allowances
    has_many :payslips, through: :payslip_allowances
end
