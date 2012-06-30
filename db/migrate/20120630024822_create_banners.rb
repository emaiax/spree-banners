class CreateBanners < ActiveRecord::Migration
  def change
    create_table :spree_banners do |t|
      t.string :title, :url
      t.integer :position
      t.boolean :enabled, :default => true
      
      t.string   :attachment_content_type, :attachment_file_name, :attachment_content_type
      t.datetime :attachment_updated_at
      t.integer  :attachment_width, :attachment_height, :default => 100
      t.integer  :attachment_size, :position
      
      t.timestamps
    end
  end
end
