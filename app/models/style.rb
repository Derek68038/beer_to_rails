class Style < ActiveRecord::Base
  attr_accessible :category, :color, :bitterness, :alcohol, :flavor, :related
  
  validates :category, presence: true
  validates :color, presence: true
  validates :bitterness, presence: true
  validates :alcohol, presence: true
  validates :flavor, presence: true
  validates :related, presence: true
  
  has_many :beers
end