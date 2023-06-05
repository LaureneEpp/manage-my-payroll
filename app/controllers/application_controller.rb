class ApplicationController < ActionController::Base
before_action :navigation
skip_before_action :verify_authenticity_token

    def navigation
        @teams = Team.all.order('name ASC')
    end
end
