class UsersController < ApplicationController
    before_action :authentication_required, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @user = User.new
            render :new
        end
    end
    
    def show
        @user = current_user
    end


    private

    def user_params
        params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin)
    end

end
