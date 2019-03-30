module Api
  module V1
    module Users
      class ProductsController < ApplicationController
        def index
          @user = find_user
          @products = @user.products
          render json: @products
        end

        def create
          @product = Product.new(product_params)
          @user = find_user
          if @product.valid?
            @user.products << @product
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

        def find_user
          User.find params[:user_id]
        end
      end
    end
  end
end