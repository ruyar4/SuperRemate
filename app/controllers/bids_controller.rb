class BidsController < ApplicationController

	def new
	    @product = Product.find(params[:product_id])
	    @bid = Bid.last
	    if current_user.id == @bid.user_id
	    	respond_to do |format|
		        format.html { redirect_to products_path, notice: 'No puedes hacer dos pujas seguidas' }
		    end
	    else
		    @product.price = @product.price + 500
		    Bid.create(bid_price:500,product:@product, user:current_user)
		    @product.save
		    redirect_to products_path
		end
  	end
end
