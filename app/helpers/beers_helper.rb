module BeersHelper
  
  def breweries_comma_separated
    brewery_names = []
    
    breweries.each do |b|    #equivalent to self.breweries.each
      brewery_names << b.place
    end
    
    brewery_names.join(", ")
  end
  
end
