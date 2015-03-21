class BeerModel < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.text :name
      t.integer :style_id
      t.text :color
      t.integer :ibu
      t.float :abv
      t.text :review
      t.text :date
      
      t.timestamps
    end
  end
end
