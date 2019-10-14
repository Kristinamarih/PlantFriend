class ProductsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @product = @user.products.build
        else
            @product = Product.new
        end
        @product.build_category
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @products = @user.products.all
        else
            @error = "That user doesn't exist" if params[:user_id]
            @products = Product.all
        end
    end

    def create
        @product = current_user.products.build(product_params)
        @product.build_category if !@product.category
        if @product.save
            redirect_to products_path
        else
            render :new
        end
    end

    def edit
        @product = Product.find_by(id: params[:id])
        redirect_to products_path if !@product || @product.user != current_user
        @product.build_category if !@product.category
    end

    def update
        @product = Product.find_by(id: params[:id])
        redirect_to products_path if !@product || @product.user != current_user
        if @product.update(product_params)
            redirect_to product_path(@product)
        else
            render :edit
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
