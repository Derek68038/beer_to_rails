class ChangeNameOfJoinsTable < ActiveRecord::Migration
  def change
    rename_table :players_positions, :beers_breweries
  end
end
