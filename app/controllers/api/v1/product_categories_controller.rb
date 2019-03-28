module Api
  module V1
    class ProductCategoriesController < ApplicationController
      def new
        @product_category = ProductCategory.new
      end

      def create
        @product_category = ProductCategory.new(product_category_params)
        if @product_category.save
          render json: @product_category, status: :ok
        else
          render json: @user.errors, status: :bad_request
        end
      end

      def update
        @product_category = ProductCategory.find(params[:id])
        if @product_category.update_attributes(product_category_params)
          render json: @product_category, status: :ok
        else
          render json: @product_category.errors, status: :bad_request
        end
      end

      def product_category_params
        params.require(:product_category).permit!
      end

      def show
        @product_category = ProductCategory.find(params[:id])
        render json: @product_category, status: :ok
      end
    end
  end
end
