module Admin
  module Api
    module V1
      class WorkTablesController < BaseController
        before_action :set_work_table, only: [:show, :update, :destroy, :start_work, :end_work, :add_diesel]

        def index
          work_tables = WorkTable.includes(:vehicle, :driver, :diesel_transactions)
          render json: work_tables, each_serializer: WorkTableSerializer
        end

        def show
          render json: @work_table, serializer: WorkTableSerializer
        end

        def create
          work_table = WorkTable.new(work_table_params)
          if work_table.save
            render json: work_table, status: :created
          else
            render json: { errors: work_table.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def update
          if @work_table.update(work_table_params)
            render json: @work_table
          else
            render json: { errors: @work_table.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def destroy
          @work_table.destroy
          head :no_content
        end

        def start_work
          @work_table.update!(start_datetime: Time.current)
          render json: @work_table, serializer: WorkTableSerializer
        end

        def end_work
          @work_table.update!(end_datetime: Time.current)
          render json: @work_table, serializer: WorkTableSerializer
        end

        def add_diesel
          diesel = @work_table.diesel_transactions.create!(diesel_params)
          render json: diesel, status: :created
        end

        private

        def set_work_table
          @work_table = WorkTable.find(params[:id])
        end

        def work_table_params
          params.require(:work_table).permit(:vehicle_id, :driver_id, :start_datetime, :end_datetime,
                                             :from_location, :to_location, :material, :party_id,
                                             :work_location, :remarks)
        end

        def diesel_params
          params.require(:diesel_transaction).permit(:vehicle_id, :date, :liters, :cost, :added_by_id, :remarks)
        end
      end
    end
  end
end
