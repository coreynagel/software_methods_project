class StaticPagesController < ApplicationController
 
  def home
  	if signed_in?
    	@micropost = current_user.microposts.build({wall_id: current_user.wall.id})
      @microposts = current_user.microposts.all
    end
  end
  
end
