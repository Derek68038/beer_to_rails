module BreweriesHelper
  
  def beer_mapper
    @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  end
  
end
