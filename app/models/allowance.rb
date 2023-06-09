class Allowance < ApplicationRecord
    # belongs_to :payslip
    has_many :payslip_allowances, dependent: :destroy
    has_many :payslips, through: :payslip_allowances
end
