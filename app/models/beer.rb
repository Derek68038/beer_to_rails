class Beer < ActiveRecord::Base
  attr_accessible :name, :style_id, :color, :ibu, :abv, :review, :date
  
  validates :name, presence: true
  validates :style_id, presence: true
  validates :color, presence: true
  validates :ibu, presence: true
  validates :abv, presence: true
  validates :review, presence: true
  validates :date, presence: true
  
  belongs_to :style
  has_and_belongs_to_many :breweries, join_table: :beers_breweries
end