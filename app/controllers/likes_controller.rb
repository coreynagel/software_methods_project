class LikesController < ApplicationController
  before_filter :signed_in_user

  def create
    @like = Like.create(params[:like])
    @post = @like.micropost
    @postnum = @post.id
    @like.save
    respond_to do |format|
      format.js
    end
  end

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