class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def index
        @users = User.all
        redirect_to user_path(current_user.id)
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
        @products = Product.order("created_at desc").limit(5)
        @comments = Comment.order("created_at desc").limit(5)
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
