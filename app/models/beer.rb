class Beer < ActiveRecord::Base
  attr_accessible :name, :style_id, :color, :ibu, :abv, :brewery_ids, :review, :date, :user_id
  
  validates :name, presence: true
  validates :style_id, presence: true
  validates :color, presence: true
  validates :ibu, presence: true
  validates :abv, presence: true
  validates :review, presence: true
  validates :date, presence: true
  
  belongs_to :style
  belongs_to :user
  has_and_belongs_to_many :breweries, join_table: :beers_breweries
  
  include BeersHelper  
end