class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:show, :edit, :update, :search,
                                        :friend_accept, :friend_deny, :friend_request, :unfriend]
  before_filter :correct_user,   only: [:edit, :update]
  
  def new
    @user = User.new
  end

  def search
    @search = params[:search]
    @users = User.search(@search)
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @friends = @user.friends.sort_by(&:first_name)
    @micropost = current_user.microposts.build({wall_id: @user.wall.id})
    @microposts = @user.wall.microposts.all
    @mutual_friends = []
    if @user != current_user
      @mutual_friends = current_user.mutual_friends(@user).sort_by(&:first_name)
    end
  end
  
  def create
    @user = User.new(params[:user])
    @user.wall = Wall.create!
    @user.profile = Profile.create!
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Facebook Project!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @profile = @user.profile
    @incoming = @user.incoming_pending_friends.sort_by(&:first_name)
    @friends = @user.friends.sort_by(&:first_name)
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Settings updated"
      sign_in @user
      redirect_to edit_user_path(@user)
    else
      flash[:failure] = "Something went wrong"
      render 'edit'
    end
  end

  def friend_request
    @user = User.find(params[:id])
    current_user.request_friend(@user)
    redirect_to user_path(@user)
  end

  def friend_accept
    @user = User.find(params[:id])
    current_user.accept_friend(@user)
    redirect_to user_path(@user)
  end

  def friend_deny
    @user = User.find(params[:id])
    current_user.unfriend(@user)
    redirect_to edit_user_path(current_user)
  end

  def unfriend
    @user = User.find(params[:id])
    current_user.unfriend(@user)
    redirect_to edit_user_path(current_user)
  end

  private

    def signed_in_user
      store_location
      redirect_to root_path, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
