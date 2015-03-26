module BreweriesHelper
  
  def beer_mapper
    @beer = BeerMapping::API.new(ENV['BEER_MAPPER_KEY'])
  end
  
end
