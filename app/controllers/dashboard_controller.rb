class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_doctor

    def graph
        @data = Patient.group_by_day(:registered_at).count
    end

    private

    def authorize_doctor
        if !current_user.doctor?
            redirect_to root_path, alert: "You are not authorized to access this page"
        end
    end
end
