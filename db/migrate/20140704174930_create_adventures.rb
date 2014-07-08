class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.string :title
      t.text :description
      t.integer :duration
      t.text :map_url
      t.text :image_url
      
      t.belongs_to :city
      t.timestamps
    end
  end
end
