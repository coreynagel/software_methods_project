class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  def request
    @user = User.find(params[:id])
    current_user.request_friend(@user)
    redirect_back_or(root_url)
  end

  def accept

  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @user = @relationship.user
    @friend = @relationship.friend
    @relationship.destroy
    Relationship.find_by_user_id_and_friend_id(@friend,@user).destroy
  end

end
