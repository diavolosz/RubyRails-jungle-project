class Admin::DashboardController < ApplicationController
 
  before_action :authorize
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"], password: ENV["HTTP_BASIC_PASSWORD"]

  def show
    @product_count = Product.count
    @category_count = Category.count
  end


end
