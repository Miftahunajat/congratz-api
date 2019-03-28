module Api
  module V1
    class UsersController < ApplicationController
      def new
        @user = User.new
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :ok
        else
          render json: @user.errors, status: :bad_request
        end
      end

      def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
          render json: @user, status: :ok
        else
          render json: @user.errors, status: :bad_request
        end
      end

      def user_params
        params.require(:user).permit!
      end

      def show
        @user = User.find(params[:id])
      end

    end
  end
end
