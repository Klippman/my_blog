class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
        # render action: 'posts'
    end

    def edit
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id]).destroy
        # @user.posts.each do |post|
        #     @user.comments.destroy_all
        #     @user.posts.destroy_all
        #     @user.destroy
        #     session[:user_id] = nil
        flash[:notice] = 'User deleted!'
        redirect_to '/'
    end

    def create
        @user = User.create(user_params)
            if @user.save
            flash[:notice] = 'Successfully Created!'
            redirect_to '/sign-in'
            else
            flash[:notice] = 'Email Already Exists!'
            render :new 
        end
    end

    def update
        @user = User.find(params[:id])
        user.update(user_params)
        flash[:notice] = 'Information has been updated!'
        redirect_to user_path
    end

    private

    def user_params 
        params.require(:user).permit(:name, :gender, :email, :password)
    end
end
