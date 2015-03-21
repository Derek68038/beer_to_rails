class JoinsTable < ActiveRecord::Migration
  def change
    create_table :players_positions, :id => false do |t|
      t.integer :beer_id
      t.integer :brewery_id
    end
  end
end
