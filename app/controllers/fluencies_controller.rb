class FluenciesController < ApplicationController
    def new
        @fluency = Fluency.new
        @user = User.find(params[:user_id])
    end

    def create
        
        Fluency.create(fluency_params)
        redirect_to current_user
    end

    def edit
    end

    def update
    end

    private

    def fluency_params
        params.require(:fluency).permit(:experience_id, :user_id, :language_id)
    end
end

