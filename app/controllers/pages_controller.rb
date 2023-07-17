class PagesController < ApplicationController
  def dashboard
    @employees_count = Employee.count
    @employees = Employee.all.order('last_name ASC')
    @managers = Employee.where(manager: true).order('last_name ASC')
    @employee = Employee.new
    @tbd_employees = Employee.joins(:position, :team).where("positions.name = 'TBD' OR teams.name = 'TBD'")
  end
end