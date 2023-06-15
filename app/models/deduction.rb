class Deduction < ApplicationRecord
    before_validation :capitalize_name

    has_many :payslip_deductions, dependent: :destroy
    has_many :payslips, through: :payslip_deductions

    validates :name, uniqueness: true
    validates :name, :description, :amount, presence: true

    private
  
    def capitalize_name
      self.name = name.capitalize
    end
end
