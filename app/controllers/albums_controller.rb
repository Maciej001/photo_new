class AlbumsController < ApplicationController
	def index
		@albums = Album.all
	end

  def new
  	@album = Album.new
  end

  def create 
		@album = Album.new(album_params)

		if @album.save
       flash[:success] = "Album created!"
  	   redirect_to @album
    else 
      flash.now[:error] = "Error."
      render 'new'
    end
	end

	def show
		@album = Album.find(params[:id])
	end



	private

  	def album_params
  		params.require(:album).permit(:name)
  	end
end
