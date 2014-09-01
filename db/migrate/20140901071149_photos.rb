class Photos < ActiveRecord::Migration
  def change
  	create_table "photos", force: true do |t|
      t.string   "photo_file_name"
      t.string   "photo_content_type"
      t.integer  "photo_file_size"
      t.datetime "photo_updated_at"
      t.string   "name"
      t.integer  "user_id"
  end
  end
end
