class StaticPagesController < ApplicationController
  before_filter :store_location
  #= Where is home
  #* if signed in home is wall
  #* not signed in sign in page is home
  def home
  	if signed_in?
      @user = current_user
    	@micropost = current_user.microposts.build({wall_id: current_user.wall.id})
      @friends = current_user.friends.all
      @microposts = current_user.newsfeed
    end
  end
  
end

