class PagesController < ApplicationController
  def dashboard
    @employees_count = Employee.count
    @employees = Employee.all.order('last_name ASC')
    @managers = Employee.where(manager: true).order('last_name ASC')
    @employee = Employee.new
  end
end
