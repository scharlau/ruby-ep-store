class CreateDvds < ActiveRecord::Migration
  def self.up
    create_table :dvds do |t|
      t.string :ASIN
      t.string :detailsPageURL
      t.string :actor
      t.string :director
      t.string :title
      t.string :genre
      t.string :image
      t.string :dateadded

      t.timestamps
    end
  end

  def self.down
    drop_table :dvds
  end
end
