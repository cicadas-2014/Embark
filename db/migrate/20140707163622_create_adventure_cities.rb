class CreateAdventureCities < ActiveRecord::Migration
  def change
    create_table :adventure_cities do |t|
    	t.belongs_to :city
    	t.belongs_to :adventure
      t.timestamps
    end
  end
end
