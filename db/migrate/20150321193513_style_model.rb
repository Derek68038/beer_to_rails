class StyleModel < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.text :category
      t.text :color
      t.text :bitterness
      t.text :alcohol
      t.text :flavor
      t.text :related
      
      t.timestamps
    end
  end
end
