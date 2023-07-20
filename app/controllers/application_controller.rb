class ApplicationController < ActionController::Base
before_action :navigation
skip_before_action :verify_authenticity_token
before_action :set_query

    def navigation
        @teams = Team.all.order('name ASC')
    end
    def set_query
        @q = Employee.ransack(params[:q])
        @employees = @q.result(distinct: true)
    end
end