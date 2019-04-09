module Api
  module V1
    module ProductCategories
      class ProductsController < ApplicationController
        def index
          @product_category = find_product_category
          @products = @product_category.products
          render json: @products
        end

        def create
          @product = Product.find params[:id]
          @product_category = find_product_category
          if @product.valid?
            @product_category.products << @product
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

        def find_product_category
          ProductCategory.find params[:product_category_id]
        end
      end
    end
  end
end
