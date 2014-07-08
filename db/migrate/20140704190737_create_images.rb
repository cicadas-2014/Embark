class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :panoramio_id
      t.text :original_image_url
      t.text :medium_image_url
      t.text :small_image_url
      t.string :longitude
      t.string :latitude
      t.boolean :confirmed, default: false
      
      t.belongs_to :city
      t.timestamps
    end
  end
end
