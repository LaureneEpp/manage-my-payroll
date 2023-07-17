class AddDefaultToEmployees < ActiveRecord::Migration[7.0]
  def change
    change_column_default :employees, :manager, from: nil, to: false
    change_column_default :positions, :name, from: nil, to: 'To be defined'
    change_column_default :employees, :position, from: nil, to: 'To be defined'
    change_column_default :employees, :team, from: nil, to: 'To be defined'
  end

  def change
    Employee.where(manager: nil).update_all(manager: false)
  end
end
