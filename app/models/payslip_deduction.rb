class PayslipDeduction < ApplicationRecord
    belongs_to :payslip
    belongs_to :deduction
end
