class ProfilesController < ApplicationController


  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      flash[:success] = "Profile updated"
      redirect_to edit_user_path(@user)
    else
      flash[:failure] = "Something went wrong: #{params[:profile]}"
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
  end

end