class MicropostsController < ApplicationController
        before_filter :signed_in_user, only: [:create, :show ,:update, :destroy]
        before_filter :correct_user, only: [:update, :destroy]

def show
  @micropost = Micropost.find(params[:id])
end


def create
  @micropost = current_user.microposts.build(params[:micropost])
  if @micropost.save
    flash[:success] = "Micropost created!"
    redirect_back_or(root_path)
  else
    redirect_back_or(root_path)
  end
end


def update
end

def destroy
  @micropost = Micropost.find(params[:id])
  @micropost.destroy
  redirect_back_or(root_path)
end

  private

  def signed_in_user
      redirect_to root_path, notice: "Please sign in." unless signed_in?
  end

  def correct_user
      @user = Micropost.find(params[:id]).user
      redirect_to(root_path) unless current_user?(@user)
  end

  def user_or_friend

  end

end