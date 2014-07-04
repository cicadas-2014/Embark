class CreateCategoryAdventures < ActiveRecord::Migration
  def change
    create_table :category_adventures do |t|
      t.belongs_to :category
      t.belongs_to :adventure
      
      t.timestamps
    end
  end
end
