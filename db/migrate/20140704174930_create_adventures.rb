class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.string :name
      t.integer :duration
      t.text :description
      t.belongs_to :city
      t.timestamps
    end
  end
end
