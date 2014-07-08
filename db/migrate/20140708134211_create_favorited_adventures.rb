class CreateFavoritedAdventures < ActiveRecord::Migration
  def change
    create_table :favorited_adventures do |t|
      t.belongs_to :user
      t.belongs_to :adventure
      
      t.timestamps
    end
  end
end
