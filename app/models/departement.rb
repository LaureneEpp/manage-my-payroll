class Departement < ApplicationRecord
    has_many :teams
    has_many :employees, through: :teams
end
