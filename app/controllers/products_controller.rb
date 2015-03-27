class ProductsController < InheritedResources::Base

	def index
		@products = Product.all
		@products.each do |product|
			@time = (Time.now - product.created_at.to_time)/3600
			if (@time > 120) && (product.status == "en remate")
				product.status = "Finalizado"
				product.save
			end
		end
	end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end

