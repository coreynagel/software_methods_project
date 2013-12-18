class RelationshipsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user

  #= Unfriend
  def destroy
    @relationship = Relationship.find(params[:id])
    @user = @relationship.user
    @friend = @relationship.friend
    @relationship.destroy
    Relationship.find_by_user_id_and_friend_id(@friend,@user).destroy
  end

  private
  #= Reroute user unless signed in
  def signed_in_user
    store_location
    redirect_to root_path, notice: "Please sign in." unless signed_in?
  end
  #= Checks for friendship
  #* Allows for user to see friends posts
  def correct_user
    @relationship = Relationship.find(params[:id])
    @user = @relationship.user
    @friend = @relationship.friend
    redirect_to(root_path) unless (current_user?(@user) or current_user?(@friend))
  end

end
