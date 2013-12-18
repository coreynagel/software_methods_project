class SessionsController < ApplicationController

  #= Starts a session when a user signs in
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_url
    else
      flash[:error] = 'Invalid email/password combination'
      redirect_to root_url
    end
  end
  #= Sign out user
  def destroy
    sign_out
    redirect_to root_url
  end
end