class CategoriesController < ApplicationController

    def index
        @categories = Category.where("id > ?", 2)
    end
end
