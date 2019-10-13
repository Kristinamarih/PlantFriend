class ProductsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @product = Product.new
    end

    def create
        @product = current_user.products.build(product_params)
        if @product.save
            redirect_to products_path
        else
            render :new
        end
    end

    private

    def product_params
        params.require(:product).permit(:name, :category, :quantity, :price, :description)
    end

end
