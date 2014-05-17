class AddImageAlbumLink < ActiveRecord::Migration
  def change
  	add_column :images, :attachable_id, :integer
  	add_column :images, :attachable_type, :string
  	add_index :images, [ :attachable_type, :attachable_id]
  end
end
