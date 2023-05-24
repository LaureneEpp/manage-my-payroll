class ApplicationController < ActionController::Base
before_action :navigation

    def navigation
        @teams = Team.all.order('name ASC')
    end
end
