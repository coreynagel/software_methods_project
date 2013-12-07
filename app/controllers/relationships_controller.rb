class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  def create

  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @user = @relationship.user
    @friend = @relationship.friend
    @relationship.destroy
    Relationship.find_by_user_id_and_friend_id(@friend,@user).destroy
  end

end
