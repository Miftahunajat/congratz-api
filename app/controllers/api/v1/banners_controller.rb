module Api
  module V1
    class BannersController < ApplicationController
      def index
        @banners = Banner.all
        render json: @banners
      end

      def create
        @banner = Banner.new(banner_params)
        if @banner.save
          render json: @banner, status: :ok
        else
          render json: @banner.errors, status: :bad_request
        end
      end

      def update
        @banner = Product.find(params[:id])
        if @banner.update_attributes(banner_params)
          render json: @banner, status: :ok
        else
          render json: @banner.errors, status: :bad_request
        end
      end

      def banner_params
        params.require(:banner).permit!
      end

    end
  end
end
