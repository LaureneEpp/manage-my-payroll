class Payslip < ApplicationRecord
  belongs_to :employee
  # has_one_attached :pdf
  has_many :payslip_allowances, dependent: :destroy
  has_many :allowances, through: :payslip_allowances
  has_many :payslip_deductions, dependent: :destroy
  has_many :deductions, through: :payslip_deductions

  validates :present, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
}

validates :absent, numericality: {
  only_integer: true,
  greater_than_or_equal_to: 0
}

  def calculate_allowances_amount
    self.allowances.sum(:amount)
  end

  def calculate_deductions_amount
    self.deductions.sum(:amount)
  end
end