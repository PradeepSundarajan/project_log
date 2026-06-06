module Worker
  module Api
    module V1
      class BaseController < ApplicationController
        protect_from_forgery with: :null_session
        before_action :authenticate_worker!

        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
        rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

        private

        def authenticate_worker!
          unless current_user
            render json: { error: "Unauthorized" }, status: :unauthorized
          end
        end

        def current_user
          @current_user ||= warden.authenticate(scope: :user)
        end

        def current_driver
          @current_driver ||= Driver.find_by!(mobile_no: current_user.mobile_no)
        end

        def record_not_found(error)
          render json: { error: error.message }, status: :not_found
        end

        def unprocessable_entity(error)
          render json: { errors: error.record.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  end
end
