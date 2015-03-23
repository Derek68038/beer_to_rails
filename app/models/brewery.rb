class Brewery < ActiveRecord::Base
  attr_accessible :place, :description
  
  validates :place, presence: true
  validates :description, presence: true
  
  has_and_belongs_to_many :beers, join_table: :beers_breweries
  
  def beer_mapper
    @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  end
  
end