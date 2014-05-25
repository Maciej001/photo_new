class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file_name
      t.string :picture
      t.references :attachable, polymorphic: true
      t.timestamps
    end

    add_index :images, [ :attachable_type, :attachable_id]
  end
end
