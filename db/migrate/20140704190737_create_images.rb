class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :big_image_url
      t.text :smaal_image_url
      t.string :longitude
      t.string :latitude
      
      t.belongs_to :city
      t.timestamps
    end
  end
end
