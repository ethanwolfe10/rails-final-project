class FollowsController < ApplicationController

    def create
        if !current_user.followings.include?(User.find(params[:user_id]))
            @follows = Follow.create(follower_id: current_user.id, followed_user_id: User.find(params[:user_id]).id)
            if @follows.save
                redirect_to user_path(params[:user_id])
            end
        end
    end

    def destroy
        @follow = Follow.find(params[:id])
        if current_user.id == @follow.follower_id
            @follow.destroy
            redirect_to user_path(params[:user_id])
        end
    end

end
