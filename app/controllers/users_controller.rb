class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :authorized, except: [:new, :create, :show]

    def index
        @users = User.all
    end

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:errors] = "Email must be present. Password must match."
            redirect_to signup_path
        end
    end

    def edit
    end

    def update
        
        @user.update(user_params)

        if @user.valid?
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:errors] = "hello you're wrong"
            redirect_to signup_path
        end
    end

    def destroy
        @user.delete
        redirect_to signup_path
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :birthday, :password, :email)
    end

    def find_user
        @user = User.find(params[:id])
    end
end

  