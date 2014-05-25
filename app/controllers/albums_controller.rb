class AlbumsController < ApplicationController
  before_filter :load_attachable, only: [:show, :destroy]

	def index
		@albums = Album.paginate(page: params[:page])
	end

  def new
  	@album = Album.new
  end

  def create 
		@album = Album.new(album_params)

		if @album.save
       flash[:success] = "Album created!"
  	   redirect_to albums_path
    else 
      flash.now[:error] = "Error."
      render 'new'
    end
	end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    flash[:success] = "Album deleted"
    redirect_to albums_path 
  end

	def show
		@album = Album.find(params[:id])
    @images = @attachable.images
	end

	private

  	def album_params
  		params.require(:album).permit(:name)
  	end

    def load_attachable

      @attachable = Album.find(params[:id])

      # in case of album -> /Album/1 will get resource = Album, id = 1
      #resource, id = request.path.split("/")[1,2]

      # it will translate into Album.find(1)
      #@attachable = resource.singularize.classify.constantize.find(id)
    end
end
