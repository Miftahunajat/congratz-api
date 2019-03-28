module Api
  module V1
    class CreativesController < ApplicationController
      def new
        @creative = Creative.new
      end

      def index
        @creatives = Creative.all
        render json: @creatives
      end

      def show
        @creative = Creative.find(params[:id])
        render json: creative
      end

      def create
        @creative = Creative.new(creative_params)
        if @creative.save
          render json: @product
        else
          render json: @product, status: :bad_request
        end
      end

      def creative_params
        params.require(:creative).permit!
      end
    end
  end
end
