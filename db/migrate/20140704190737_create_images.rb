class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :url
      t.string :longitude
      t.string :latitude
      t.belongs_to :adventure

      t.timestamps
    end
  end
end
