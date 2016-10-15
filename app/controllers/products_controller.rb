class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)

  end

  def show
    @product = Product.find params[:id]
    # create a new instance for a review in the context of the particular product
    @review = @product.reviews.new
    # if this particular product has reviews, pass them down to the view

    if @product.reviews
      @all_reviews = @product.reviews
      @all_reviews
    end
  end



end


