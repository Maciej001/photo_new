class Image < ActiveRecord::Base

	belongs_to :attachable, polymorphic: true
	
	validates :file_name, presence: true
	validates :attachable_id, presence: true

	mount_uploader :picture, PictureUploader
end
