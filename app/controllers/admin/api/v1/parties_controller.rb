module Admin
  module Api
    module V1
      class PartiesController < BaseController
        before_action :set_party, only: [:show, :update, :destroy]

        def index
          render json: Party.all
        end

        def show
          render json: @party
        end

        def create
          party = Party.new(party_params)
          if party.save
            render json: party, status: :created
          else
            render json: { errors: party.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def update
          if @party.update(party_params)
            render json: @party
          else
            render json: { errors: @party.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def destroy
          @party.destroy
          head :no_content
        end

        private

        def set_party
          @party = Party.find(params[:id])
        end

        def party_params
          params.require(:party).permit(:name, :phone_no, :address, :gst_no)
        end
      end
    end
  end
end
