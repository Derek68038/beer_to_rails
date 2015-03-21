class Brewery < ActiveRecord::Base
  attr_accessible :place, :description
  
  validates :text, presence: true
  validates :description, presence: true
  
  has_and_belongs_to_many :beers, join_table: :beers_breweries
end