module Api
  module V1
    class ProductsController < ApplicationController
      def index
        @products = Product.all
        render json: @products
      end

      def create
        @product = Product.new(product_params)
        if @product.save
          render json: @product, status: :ok
        else
          render json: @product.errors, status: :bad_request
        end
      end

      def update
        @product = Product.find(params[:id])
        if @product.update_attributes(product_params)
          render json: @product, status: :ok
        else
          render json: @product.errors, status: :bad_request
        end
      end

      def product_params
        params.require(:product).permit!
      end
    end
  end
end
