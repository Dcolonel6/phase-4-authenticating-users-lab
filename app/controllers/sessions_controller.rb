class SessionsController < ApplicationController
    wrap_parameters format: []
    # rescue_from ActiveRecord::RecordNotFound,  with: :render_not_found_user

    def create 
        user = User.find_by(username: params[:username])
        if user
            session[:user_id] ||= user.id
            render json: user
        else
            render json: { error: "Invalid credentials"}, status: :unauthorized
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end

    # private
    # def render_not_found_user
    #     render json: {error: "User not found"}, status: :not_found
    # end
end