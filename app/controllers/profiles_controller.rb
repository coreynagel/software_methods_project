class ProfilesController < ApplicationController
  before_filter :signed_in_user
  #= Update profile information from form
  def update
    @profile = Profile.find(params[:id])
    @user = @profile.user
    if @profile.update_attributes(params[:profile])
      flash[:success] = "Profile updated"
      redirect_to edit_user_path(@user)
    else
      flash[:failure] = "Something went wrong: #{params[:profile]}"
      redirect_to edit_user_path(@user)
    end
  end

end