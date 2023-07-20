class PagesController < ApplicationController
  def dashboard
    @employees_count = Employee.count
    # @tbd_position = Employee.where(position: 'TBD')
    # @tbd_team = Employee.where(team: 'TBD')
    # @tbd_dpt = Team.joins(:departement).where(departements: {name: 'TBD'})
    @employees = Employee.all.order('last_name ASC').excluding(@tbd_employees)
    @managers = Employee.where(manager: true).order('last_name ASC')
    @employee = Employee.new
    @tbd_employees = Employee.joins(:position, :team).where("positions.name = 'TBD' OR teams.name = 'TBD'")
  end
end