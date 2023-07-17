class Position < ApplicationRecord
    has_many :employees

    # validates :name, uniqueness: true
end
