class ProductsController < ApplicationController
  before_action :authorize

  def index
    # uses model
    @products = Product.all.order(created_at: :desc)
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]

    # view
    # render: index
  end

  def show
    @product = Product.find params[:id]
  end

end
