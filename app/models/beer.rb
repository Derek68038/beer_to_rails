class Beer < ActiveRecord::Base
  attr_accessible :name, :style_id, :color, :ibu, :abv, :review, :date
end