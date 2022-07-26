class Admin::CategoriesController < ApplicationController
 
  before_action :authorize
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"], password: ENV["HTTP_BASIC_PASSWORD"]

  def index
    @categories_list = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def delete
    @category_delete = Category.find()
    # @product.destroy
    # redirect_to [:admin, :products], notice: 'Product deleted!'
  end


  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
