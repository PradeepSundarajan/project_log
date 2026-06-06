module Worker
  module Api
    module V1
      class SessionsController < BaseController
        skip_before_action :authenticate_worker!, only: [:create]

        def create
          user = User.find_by(mobile_no: params[:mobile_no])

          if user&.valid_password?(params[:password])
            sign_in(:user, user)
            render json: { message: "Signed in successfully", user: { id: user.id, mobile_no: user.mobile_no } }
          else
            render json: { error: "Invalid mobile number or password" }, status: :unauthorized
          end
        end

        def destroy
          sign_out(:user)
          render json: { message: "Signed out successfully" }
        end
      end
    end
  end
end
