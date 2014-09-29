class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string   "title",
      t.text     "description",
      t.decimal  "price", precision: 8, scale: 2,
      t.datetime "created_at",
      t.datetime "updated_at",
      t.string   "image_file_name",
      t.string   "image_content_type",
      t.integer  "image_file_size",
      t.datetime "image_updated_at",
      t.boolean  "available", default: true,

      t.timestamps
    end
  end
end
