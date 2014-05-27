class AddCoverPhotoToAlbums < ActiveRecord::Migration
  def change
  	add_column :albums, :cover_photo, :string
  end
end
