class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:product_id] && @product = Product.find_by_id(params[:product_id])
            @comments = @product.comments
        else
            @comments = Comment.all
        end
    end

    def new
        if params[:product_id] && @product = Product.find_by_id(params[:product_id])
            @comment = @product.comments.build(comment_params)
        else
            @comment = Comment.new
        end      
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comments_path
        else
            render :new
        end
    end

    def show
        @comment = Comment.find_by(id: params[:id])
    end

    def edit
        @comment = Comment.find_by(id: params[:id])
    end

    def update
        @comment = Comment.find_by(id: params[:id])
        if @comment.update(comment_params)
            redirect_to comment_path(@comment)
        else
            redirect_to :edit
        end
    end

    def destroy
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :product_id)
    end
end
