class CommentsController < ApplicationController
    before_filter :signed_in_user, only: [:create,:destroy]
    before_filter :correct_user, only: [:destroy]

  #= Creates a comment:
  #* find micropost commenting on
  #* create comment from params
  #* show save success or failure
  #* redirect to path of post
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.create(params[:comment])
    if @comment.save
      flash[:success] = "Comment created!"
    else

      flash[:failure] = "#{@comment.content}  An error happened"
    end
    redirect_to micropost_path(@micropost)
  end
  #= Deletes a comment:
  #* locate comment
  #* delete in database
  #* redirect to post's path
  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to micropost_path(@micropost)
  end

  private
  #= Verify user is signed in:
  #*redirect to sign in page unless signed in
  #*make sure user is deleting or creating their own comment
  def signed_in_user
      redirect_to root_path, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = Comment.find(params[:id]).user
      redirect_to(root_path) unless current_user?(@user)
    end
end