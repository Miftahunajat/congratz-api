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

      def index
        @users = User.all
        render json: @users
      end


      def user_params
        params.require(:user).permit!
      end

      def show
        @user = User.find(params[:id])
        render json: @user, status: :ok
      end

      def available_username
        @user = User.find_by(username: params[:username])
        if @user.present?
          render json: { status: false, message: "Username has been taken" }, status: :bad_request
        else
          render json: { status: true, message: "Username Available" }, status: :ok
        end
      end
    end
  end
end
