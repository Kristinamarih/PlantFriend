class CategoriesController < ApplicationController

    def index
        @categories = Category.where("id > ?", 2)
    end

    def show
        @category = Category.find_by(id: params[:id])
    end
end
