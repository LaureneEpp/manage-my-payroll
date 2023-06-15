class Allowance < ApplicationRecord
    before_validation :capitalize_name

    has_many :payslip_allowances, dependent: :destroy
    has_many :payslips, through: :payslip_allowances

    validates :name, :description, :amount, presence: true
    validates :name, uniqueness: true
  
    private
  
    def capitalize_name
      self.name = name.capitalize
    end
end
