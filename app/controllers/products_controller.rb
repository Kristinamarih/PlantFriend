class ProductsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @product = Product.new
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @products = @user.products
        else
            @error = "That user doesn't exist" if params[:user_id]
            @products = Product.all 
        end
    end

    def create
        @product = current_user.products.build(product_params)
        if @produc t.save
            redirect_to products_path
        else
            render :new
        end
    end

    def show
        @product = Product.find_by_id(params[:id])
        redirect_to products_path if !@product
    end

    private

    def product_params
        params.require(:product).permit(:name, :category, :quantity, :price, :description)
    end

end
