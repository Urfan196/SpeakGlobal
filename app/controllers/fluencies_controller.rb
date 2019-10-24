class FluenciesController < ApplicationController
    
    before_action :find_fluency, only: [:edit, :update, :destroy]
    
    def index
        @user = current_user
    end

    def new
        @fluency = Fluency.new
        @user = User.find(params[:user_id])
        @languages = @user.unlearned_languages
    end

    def create
        Fluency.create(fluency_params)
        redirect_to current_user    
    end

    def edit 
        @user = current_user
        @languages = @user.languages 
    end

    def update
        @fluency.update(fluency_params)
        redirect_to fluencies_path
    end

    def destroy
        @fluency.destroy
        redirect_to fluencies_path
    end

    private

    def fluency_params
        params.require(:fluency).permit(:experience_id, :user_id, :language_id)
    end

    def find_fluency
        @fluency = Fluency.find(params[:id]) 
    end
end

