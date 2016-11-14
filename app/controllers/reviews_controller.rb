class ReviewsController < ApplicationController
   before_action :require_login

#Create and destory reviews as a user if logged in

   def create
     @product = Product.find(params[:product_id].to_i)
     @review = @product.reviews.new(description: params[:review][:description],
                                   rating: params[:review][:rating])
     @review.user_id = current_user.id
     @review.save
     redirect_to product_path(@product)
   end

   def destroy
     @review = Review.find params[:id]
     @review.destroy
     redirect_to product_path(params[:product_id])
   end

   private

   def require_login
     unless current_user
       flash[:error] = "You must be logged in to access this section"
     end
   end

 end