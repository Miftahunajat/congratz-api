module Api
  module V1
    module Users
      class FavoriteController < ApplicationController
        def index
          @user = find_user
          @favorites = @user.favorites
          render json: @favorites
        end

        def create
          @favorite = Product.find params[:favorite_id]
          @user = find_user
          if @user.favorites << @favorite
            render json: @favorite, status: :ok
          else
            render json: @favorite.errors, status: :bad_request
          end
        end

        def destroy
          @favorite = Product.find(params[:id])
          if @favorite.destroy
            render json: @favorite
          else
            render json: @favorite.errors, status: :bad_request
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