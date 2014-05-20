class ImagesController < ApplicationController
  # sets the @attachable
  before_filter :load_attachable

  def index
    @images = @attachable.images
  end

  def new
    @image = @attachable.images.new
  end

  def create 
    @image = @attachable.images.new(image_params)

    @image.file_name = "file_name_2"

    if @image.save
      redirect_to @attachable, notice: "Image added"
    else
      render :new
    end
	end

	private

  	def image_params
  		params.require(:image).permit(:file_name, :picture)
  	end

    def load_attachable

      # in case of album -> /Album/1 will get resource = Album, id = 1
      resource, id = request.path.split("/")[1,2]

      # it will translate into Album.find(1)
      @attachable = resource.singularize.classify.constantize.find(id)
    end
end

