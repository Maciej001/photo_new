 class StaticPagesController < ApplicationController
  def home
  	if signed_in?
    	@micropost = current_user.microposts.build 

      # creates collection of feed_item(s), ie. microposts for signed in user
      # later you can reference particular feed_item. 
    	@feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end
  
  def help
  end

  def contact
  end

end
