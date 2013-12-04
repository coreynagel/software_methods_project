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
    redirect_to(user_path(@micropost.wall.user))
  else
    #redirect_to(user_path(@micropost.wall.user))
  end
end


def update
end

def destroy
  current_user.microposts.delete
  redirect_to(user_path(current_user))
end

	private

	def signed_in_user
      store_location
      redirect_to root_path, notice: "Please sign in." unless signed_in?
  end

  def correct_user
      @user = Micropost.find(params[:id]).user
      redirect_to(root_path) unless current_user?(@user)
  end

  def user_or_friend

  end

end
