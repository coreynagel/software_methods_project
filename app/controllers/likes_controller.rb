class LikesController < ApplicationController
  before_filter :signed_in_user

  #= Saves a like associeated with a micropost and a user
  def create
    @like = Like.create(params[:like])
    @post = @like.micropost
    @postnum = @post.id
    @like.save
    respond_to do |format|
      format.js
    end
  end
  #= Deletes a like when unlike
  def destroy
    @like = Like.find(params[:id])
    @post = @like.micropost
    @postnum = @post.id
    @like.destroy
    respond_to do |format|
      format.js
    end
  end
end