class ProfilesController < ApplicationController


  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to edit_user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
  end

end