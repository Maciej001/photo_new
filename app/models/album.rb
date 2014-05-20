class Album < ActiveRecord::Base
	include Attachable

	def collection
		Image.where("attachable_id = ? and attachable_type = ?", id, "album")
	end

end



