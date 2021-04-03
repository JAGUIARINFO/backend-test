module Api
  module V1
    class ComplainsController < ApplicationController
      before_action :set_complain, only: [:show, :update, :destroy]

      # GET /complains
      def index
        @complains = Complain.all

        if params[:city].nil?
          params[:city] = ''
        end
        if params[:company].nil?
          params[:company] = ''
        end

        if params[:city] != '' and params[:company] != ''
          result = Complain.where("city = ? AND company = ?", params[:city], params[:company]).size
        elsif params[:city] != ''
          result = Complain.where("city = ?", params[:city]).size
        elsif params[:company] != ''
          result = Complain.where("company = ?", params[:company]).size
        else
          result = Complain.count
        end
        
        render json: result

      end

      # GET /complains/1
      def show
        render json: @complain
      end

      # POST /complains
      def create
        #Complain.delete_all

        @complain = Complain.new(complain_params)

        if @complain.save
          render json: @complain, status: :created
        else
          render json: {status: 'ERROR', message: 'Can not add the complain.', data:@complain.err}, status: :unprocessable_entity
        end

      end

      # PATCH/PUT /complains/1
      def update
        if @complain.update(complain_params)
          render json: {status: 'SUCCESS', message: 'Complain updated.', data:@complain}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Can not update complain.', data:@complain}, status: :unprocessable_entity
        end
      end

      # DELETE /complains/1
      def destroy
        @complain.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_complain
          @complain = Complain.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def complain_params
          params.require(:complain).permit(:title, :description, :city, :state, :country, :company)
        end
    end
  end
end
