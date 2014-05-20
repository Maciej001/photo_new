class AlbumsController < ApplicationController
    # sets the @attachable
  before_filter :load_attachable, only: :show

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
  	   redirect_to @album
    else 
      flash.now[:error] = "Error."
      render 'new'
    end
	end

	def show
		@album = Album.find(params[:id])
    @collection_images = @album.collection
	end




	private

  	def album_params
  		params.require(:album).permit(:name)
  	end

    def load_attachable

      # in case of album -> /Album/1 will get resource = Album, id = 1
      resource, id = request.path.split("/")[1,2]

      # it will translate into Album.find(1)
      @attachable = resource.singularize.classify.constantize.find(id)
    end
end
