class StaticPagesController < ApplicationController
 
  def home
    if signed_in?
      @newsfeed
 
    end
  end
  
end
