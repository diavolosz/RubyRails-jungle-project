class ProductsController < ApplicationController

  def index
    # uses model
    @products = Product.all.order(created_at: :desc)
    # view
    # render: index
  end

  def show
    @product = Product.find params[:id]
  end

end
