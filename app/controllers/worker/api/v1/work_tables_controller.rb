module Worker
  module Api
    module V1
      class WorkTablesController < BaseController
        before_action :set_work_table, only: [:show, :start_work, :end_work]

        def index
          work_tables = WorkTable.where(driver_id: current_driver.id)
                                 .includes(:vehicle, :party, :diesel_transactions)
                                 .order(created_at: :desc)
          render json: work_tables, each_serializer: WorkTableSerializer
        end

        def show
          render json: @work_table, serializer: WorkTableSerializer
        end

        def start_work
          if @work_table.start_datetime.present?
            render json: { error: "Work already started" }, status: :unprocessable_entity
          else
            @work_table.update!(start_datetime: Time.current)
            render json: @work_table, serializer: WorkTableSerializer
          end
        end

        def end_work
          if @work_table.end_datetime.present?
            render json: { error: "Work already ended" }, status: :unprocessable_entity
          elsif @work_table.start_datetime.blank?
            render json: { error: "Work has not been started yet" }, status: :unprocessable_entity
          else
            @work_table.update!(end_datetime: Time.current)
            render json: @work_table, serializer: WorkTableSerializer
          end
        end

        private

        def set_work_table
          @work_table = WorkTable.where(driver_id: current_driver.id).find(params[:id])
        end
      end
    end
  end
end
