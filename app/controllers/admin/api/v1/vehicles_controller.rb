module Admin
  module Api
    module V1
      class VehiclesController < BaseController
        before_action :set_vehicle, only: [:show, :update, :destroy, :update_status]

        def index
          render json: Vehicle.all
        end

        def show
          render json: @vehicle
        end

        def create
          vehicle = Vehicle.new(vehicle_params)
          if vehicle.save
            render json: vehicle, status: :created
          else
            render json: { errors: vehicle.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def update
          if @vehicle.update(vehicle_params)
            render json: @vehicle
          else
            render json: { errors: @vehicle.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def destroy
          @vehicle.destroy
          head :no_content
        end

        def update_status
          if @vehicle.update(status: params[:status])
            render json: @vehicle
          else
            render json: { errors: @vehicle.errors.full_messages }, status: :unprocessable_entity
          end
        end

        private

        def set_vehicle
          @vehicle = Vehicle.find(params[:id])
        end

        def vehicle_params
          params.require(:vehicle).permit(:vehicle_no, :vehicle_type, :display_name, :capacity, :status)
        end
      end
    end
  end
end
