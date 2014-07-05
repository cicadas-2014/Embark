class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.belongs_to :city
      t.text :map_url
      t.text :image_url
      t.timestamps
    end
  end
end
