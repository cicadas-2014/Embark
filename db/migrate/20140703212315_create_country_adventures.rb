class CreateCountryAdventures < ActiveRecord::Migration
  def change
    create_table :country_adventures do |t|
      t.belongs_to :country
      t.belongs_to :adventure
      
      t.timestamps
    end
  end
end
