class BreweryModel < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.text :place
      t.text :description
      
      t.timestamps
    end
  end
end
