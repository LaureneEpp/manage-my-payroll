class Employee < ApplicationRecord
  belongs_to :team
  
  def fullname
    "#{first_name} #{last_name}"
  end
end
