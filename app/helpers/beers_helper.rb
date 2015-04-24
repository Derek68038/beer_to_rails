module BeersHelper
  
  def breweries_comma_separated
    brewery_names = []
    
    breweries.each do |b|    
      brewery_names << b.place
    end
    
    brewery_names.join(", ")
  end
  
end
