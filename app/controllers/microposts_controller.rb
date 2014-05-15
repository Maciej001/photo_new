class MicropostsController < ApplicationController
 before_action :signed_in_user, only: [:create, :delstroy]
 before_action :correct_user, only: [:destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      # user is signed_in but 
      # if the post creation fails there is no 
      # feed_item which breaks displaying the 
      # home page cause feed_items.any? does not work 
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def correct_user
      # use find_by instead of find. find rises exception if
      # post not found, find_by returns nil
      # it could be  @micropost = Micropost.find_by(id: params[:id])
      # but it's better for securities reasons to run lookups
      # thru assocciations 
      # http://www.rubyfocus.biz/blog/2011/06/15/access_control_101_in_rails_and_the_citibank-hack.html
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end