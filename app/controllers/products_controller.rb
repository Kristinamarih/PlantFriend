class ProductsController < ApplicationController
    helper ProductsHelper
    before_action :redirect_if_not_logged_in
    before_action :find_product, only: [:show, :edit, :destroy, :update]

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @product = @user.products.build
        else
            @product = Product.new
        end
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
        if @product.save
            redirect_to products_path
        else
            render :new
        end
    end

    def edit
        redirect_to products_path if !@product || @product.user != current_user
    end

    def update
        redirect_to products_path if !@product || @product.user != current_user
        if @product.update(product_params)
            redirect_to product_path(@product)
        else
            render :edit
        end
    end

    def show
        redirect_to products_path if !@product
    end

    def destroy
        @product.destroy
        redirect_to products_path
    end

    private

    def product_params
        params.require(:product).permit(:name, :category_id, :quantity, :price, :description)
    end

    def find_product
        @product = Product.find_by(id: params[:id])
    end
end
