module Api
  module V1
    module Users
      class CartsController < ApplicationController
        def index
          @user = find_user
          @carts = @user.carts
          render json: @carts
        end

        def create
          @cart = Cart.find_by(user_id: params[:user_id], product_id: params[:product_id])
          @product = Product.find_by = params[:product_id]
          if @cart.present? && !params.has_key?(:count)
            @cart.increment(:count, 1)
          elsif @cart.present?
            @cart.update(count: params[:count])
          else
            @cart = Cart.new(user_id: params[:user_id], product_id: params[:product_id], count: 0, price: @product.price)
            @cart.save!
          end
          render json: @cart
        end

        def destroy
          @cart = Cart.find_by(user_id: params[:user_id], product_id: params[:product_id])
          if @cart.destroy
            render json: @cart
          else
            render json: @cart.errors, status: :bad_request
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