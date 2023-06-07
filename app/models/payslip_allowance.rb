class PayslipAllowance < ApplicationRecord
    belongs_to :payslip
    belongs_to :allowance
end
