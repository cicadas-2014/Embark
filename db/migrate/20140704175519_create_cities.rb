class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :longitude
      t.string :latitude

      t.belongs_to :country
      t.timestamps
    end
  end
end
