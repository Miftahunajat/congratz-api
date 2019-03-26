class HomeController < ApplicationController
  def index
    render json: 'HELLO WORLD', status: :ok
  end
end
