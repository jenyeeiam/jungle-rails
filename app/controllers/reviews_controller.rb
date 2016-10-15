class ReviewsController < ApplicationController
  before_filter :verify_credentials

  def create

    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)

    @review.user = current_user

    if @review.save
      redirect_to product_path(@product)
    end
  end

  def destroy
    @review = Review.find params[:id]
    @product = Product.find params[:product_id]
    puts @review.inspect
    @review.destroy

    redirect_to product_path(@product)
  end


  private
    def review_params
      params.require(:review).permit(
        :description,
        :rating,
      )
    end

    def verify_credentials
      user = current_user
      user.authenticate(params[:password])
    end

end
