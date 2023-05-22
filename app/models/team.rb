class Team < ApplicationRecord
    has_many :employees
    belongs_to :departement
    # enum :name, { 
    #     "HR": 0, 
    #     "Accounting": 1,
    #     "Financial controller": 2,
    #     "Legal": 3, 
    #     "IT Project management": 4, 
    #     "Project team": 5,
    #     "Help Desk": 6,
    #     "Client Support": 7,
    #     "IT Architecture": 8,
    #     "IT Applications": 9,
    #     "Managers": 10, 
    #     "Top Management": 11
    # }
end
