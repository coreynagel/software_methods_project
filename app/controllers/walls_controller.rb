class WallsController < ApplicationController

 def destroy
   @wall = Wall.find(params[:id])
   @wall.destroy
 end

def empty
  @wall = Wall.find(params[:id])
  @wall.microposts.each do |m|
    m.destroy
  end
  redirect_to edit_user_path(current_user)
end

end
