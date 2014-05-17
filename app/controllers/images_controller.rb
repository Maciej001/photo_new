class ImagesController < ApplicationController
  def new
  	@image = Image.new
  end

  def create 
  	@album = Album.find(params[:album_id])
	  @image = @album.images.create(photo_params)

		redirect_to album_path(@album)
	end

	private

  	def image_params
  		params.require(:image).permit(:file_name)
  	end
end
