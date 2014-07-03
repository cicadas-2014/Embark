class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.string :name
      t.string :category
      t.text :description
      t.integer :duration


      t.timestamps
    end
  end
end
