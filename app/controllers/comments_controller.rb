class CommentsController < ApplicationController
    before_filter :signed_in_user, only: [:create,:destroy]
    before_filter :correct_user, only: [:destroy]

  def create
    @comment = current_user.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_back_or(root_path)
    else
      redirect_back_or(root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back_or(root_path)
  end

  private

  def signed_in_user
      redirect_to root_path, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = Comment.find(params[:id]).user
      redirect_to(root_path) unless current_user?(@user)
    end
end