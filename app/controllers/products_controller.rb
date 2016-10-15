class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)

  end

  def show
    @product = Product.find params[:id]
    @review = @product.reviews.new
    if @product.reviews
      @reviews = @product.reviews
      @reviews
    end

  end

end


