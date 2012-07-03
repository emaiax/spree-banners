class CreateSpreeBannersTaxonsTable < ActiveRecord::Migration
  def up
    create_table :spree_banners_taxons, :id => false do |t|
      t.integer :banner_id
      t.integer :taxon_id
    end
  end

  def down
    drop_table :spree_banners_taxons
  end
end
