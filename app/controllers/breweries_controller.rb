class BreweriesController < ApplicationController
  
  def index
    @brewery = Brewery.order(:place)
  end
  
  def new
    @brewery = Brewery.new
  end
  
  def create
    @brewery = Brewery.new(params[:brewery])
    if @brewery.save
      redirect_to "/breweries"
    else
      render "new"
    end
  end
  
end
