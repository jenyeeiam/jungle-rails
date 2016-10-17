require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before :each do
      category = Category.create(name: 'clothes')
      @product = category.products.new(name: 'shirt', price: 100, quantity: 100)
    end

    it 'should validate presence of name' do
      @product.name = nil
      @product.save
      expect(@product.errors.size).to eq(1)
      # puts @product.errors.full_messages
    end

    it 'should validate presence of price_cents' do
      @product.price_cents = nil
      @product.save
      expect(@product.price_cents).to_not be_present
    end

    xit 'should validate presence of quantity' do
      @product.quantity = nil
      @product.save
      expect(@product.errors.size).to eq(1)
      puts @product.errors.full_messages
    end

    it 'should validate presence of category_id' do
      @product.category_id = nil
      @product.save
      expect(@product.errors.size).to eq(1)
    end

  end
end
