module Admin
  module Api
    module V1
      class BaseController < ApplicationController
        protect_from_forgery with: :null_session
        before_action :authenticate_admin!

        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
        rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

        private

        def authenticate_admin!
          unless current_user
            render json: { error: "Unauthorized" }, status: :unauthorized
          end
        end

        def current_user
          @current_user ||= warden.authenticate(scope: :user)
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
