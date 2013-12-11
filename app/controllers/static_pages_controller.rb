class StaticPagesController < ApplicationController
 
  def home
  	if signed_in?
    	@micropost = current_user.microposts.build({wall_id: current_user.wall.id})
      @microposts = current_user.microposts.all
      @friends = current_user.friends.all
      @friends.each do |f|
          @microposts +=  f.microposts.all
      end
    end
  end
  
end
