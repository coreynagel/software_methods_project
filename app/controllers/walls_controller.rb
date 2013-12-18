class WallsController < ApplicationController

#= Deletes wall
 def destroy
   @wall = Wall.find(params[:id])
   @wall.destroy
 end

#= Clears all posts on wall
def empty
  @wall = Wall.find(params[:id])
  @wall.microposts.each do |m|
    m.destroy
  end
  redirect_to edit_user_path(current_user)
end

end
