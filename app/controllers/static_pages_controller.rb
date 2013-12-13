class StaticPagesController < ApplicationController
 
  def home
  	if signed_in?
      @user = current_user
    	@micropost = current_user.microposts.build({wall_id: current_user.wall.id})
      @friends = current_user.friends.all
      @microposts = current_user.microposts.all
      @friends.each do |f|
          @microposts +=  f.microposts.all
      end
    end
  end
  
end
