module Admin
  module Api
    module V1
      class DieselTransactionsController < BaseController
        before_action :set_diesel_transaction, only: [:show, :update, :destroy]

        def index
          transactions = DieselTransaction.includes(:vehicle, :work_table, :added_by)
          render json: transactions
        end

        def show
          render json: @diesel_transaction
        end

        def create
          transaction = DieselTransaction.new(diesel_transaction_params)
          if transaction.save
            render json: transaction, status: :created
          else
            render json: { errors: transaction.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def update
          if @diesel_transaction.update(diesel_transaction_params)
            render json: @diesel_transaction
          else
            render json: { errors: @diesel_transaction.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def destroy
          @diesel_transaction.destroy
          head :no_content
        end

        def report
          render json: DieselTransaction.group(:vehicle_id).sum(:liters)
        end

        private

        def set_diesel_transaction
          @diesel_transaction = DieselTransaction.find(params[:id])
        end

        def diesel_transaction_params
          params.require(:diesel_transaction).permit(:vehicle_id, :work_table_id, :date, :liters,
                                                     :cost, :added_by_id, :remarks)
        end
      end
    end
  end
end
