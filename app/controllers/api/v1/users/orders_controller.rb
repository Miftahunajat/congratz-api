module Api
  module V1
    module Users
      class OrdersController < ApplicationController
        def index
          @user = find_user
          @orders = @user.orders
          render json: @orders
        end

        def create
          @carts = Cart.where user_id: params[:user_id]
          @user = find_user
          total = @carts.map(&:price).inject(0, &:+)
          if @user.balance < total
            render json: { status: 'failed', message: 'Saldo tidak mencukupi' }, status: :bad_request
          else
            @carts.each do |cart|
              order = Order.create(user_id: cart.user_id, product_id: cart.product_id, address: order_params[:address], total: cart.price)
              @user.decrement('balance', order.total)
              @user.save
              cart.destroy
            end
            render json: @user, status: :ok
          end
        end

        def order_params
          params.require(:order).permit!
        end

        def find_user
          User.find params[:user_id]
        end
      end
    end
  end
end