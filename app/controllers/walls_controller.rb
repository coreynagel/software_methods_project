class WallsController < ApplicationController

 def destroy
   @wall = Wall.find(params[:id])
   @wall.destroy
 end
end
