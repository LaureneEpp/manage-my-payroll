class PayslipAllowance < ApplicationRecord
    belongs_to :payslip
    belongs_to :allowance

    validates :allowance_id, uniqueness: {
        scope: [ :payslip_id ]
      }
end
