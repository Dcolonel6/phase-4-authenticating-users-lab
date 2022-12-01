class UsersController < ApplicationController
    wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_user

    def show
        user = find_user
        render json: user, status: :ok        
    end

    private
    def find_user
        User.find(session[:user_id])
    end

    def render_not_found_user
        render json: {error: "Please login again"}, status: :not_found
    end
end
