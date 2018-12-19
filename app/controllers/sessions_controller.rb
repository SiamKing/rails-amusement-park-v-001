class SessionsController < ApplicationController

    def new
        @users = User.all
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user_name])
        if @user && @user.authenticate(params[:password]) 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @user = User.new
            render :new
        end
    end

    def destroy
        reset_session
        redirect_to root_path
    end

end
