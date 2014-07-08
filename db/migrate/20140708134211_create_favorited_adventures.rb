class CreateFavoritedAdventures < ActiveRecord::Migration
  def change
    create_table :favorited_adventures do |t|

      t.timestamps
    end
  end
end
