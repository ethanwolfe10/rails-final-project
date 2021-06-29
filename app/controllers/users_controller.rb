class UsersController < ApplicationController

    def index
        
    end

    def show
        @user = User.find(params[:id])
        if current_user == @user
            render 'showself'            
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path
        else
            #redirect back with error
        end
    end

    private

    def user_params
        params.require(:user).permit(:display_name, :bio)
    end

end