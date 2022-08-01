require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before :each do
      @product = Product.new( 
        name: "flower",
        description: "red colored flower",
        quantity: 12,
        price: 103,
        category: Category.new( name: "flower plants")
      )
    end
    
    it 'should make a product' do
      @product = Product.new( 
        name: "flower",
        description: "red colored flower",
        quantity: 12,
        price: 103,
        category: Category.new( name: "flower plants")
      )
      expect(@product).to be_truthy
    end

    it 'should show that name is present' do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages[0]).to eq("Name can't be blank") 
    end

    it 'validates the price is present' do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages[2]).to eq("Price can't be blank")
    end

    it 'validates a quantity is present' do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
    end

    it 'validates a category is present' do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages[1]).to eq("Category can't be blank")
    end

  end
end


# it 'should not exist for new records' do
#   @widget = Widget.new
#   expect(@widget.id).to be_nil
# end