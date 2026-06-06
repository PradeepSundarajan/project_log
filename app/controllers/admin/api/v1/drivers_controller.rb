module Admin
  module Api
    module V1
      class DriversController < BaseController
        before_action :set_driver, only: [:show, :update, :destroy]

        def index
          render json: Driver.all
        end

        def show
          render json: @driver
        end

        def create
          driver = Driver.new(driver_params)
          if driver.save
            render json: driver, status: :created
          else
            render json: { errors: driver.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def update
          if @driver.update(driver_params)
            render json: @driver
          else
            render json: { errors: @driver.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def destroy
          @driver.destroy
          head :no_content
        end

        private

        def set_driver
          @driver = Driver.find(params[:id])
        end

        def driver_params
          params.require(:driver).permit(:name, :mobile_no, :address, :license_no, :experience_years, :status)
        end
      end
    end
  end
end
