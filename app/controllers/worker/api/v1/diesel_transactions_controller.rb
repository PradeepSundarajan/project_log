module Worker
  module Api
    module V1
      class DieselTransactionsController < BaseController
        def index
          work_table_ids = WorkTable.where(driver_id: current_driver.id).pluck(:id)
          transactions = DieselTransaction.where(work_table_id: work_table_ids)
                                          .includes(:vehicle, :work_table)
                                          .order(date: :desc)
          render json: transactions
        end
      end
    end
  end
end
