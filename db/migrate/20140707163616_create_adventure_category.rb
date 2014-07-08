class CreateAdventureCategories < ActiveRecord::Migration
  def change
    create_table :adventure_categories do |t|
    	t.belongs_to :category
    	t.belongs_to :adventure
      t.timestamps
    end
  end
end
