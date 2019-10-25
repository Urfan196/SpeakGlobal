class UsersController < ApplicationController
    before_action :find_user, only: [:show, :update, :destroy]
    before_action :authorized, except: [:new, :create, :show]

    def index
        all_users = User.search(params[:search])
        @users = all_users.reject {|user| user == current_user }
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
            flash[:errors] = "You are wrong"
            render :new
        end
    end

    def edit
       
        if params[:id].to_i == current_user.id
            find_user
        else
            redirect_to edit_user_path(current_user)
        end
    end

    def update
        
        @user.update(user_params)

        if @user.valid?
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:errors] = "hello you're wrong"
            render :edit
        end
    end

    def destroy
        @user.delete
        redirect_to signup_path
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :birthday, :password, :email, :search)
    end

    def find_user
        @user = User.find(params[:id])
    end
end

  