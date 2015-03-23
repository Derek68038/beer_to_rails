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
  
  def show
    @brewery = Brewery.find_by_id(params[:id])
    @beer = @brewery.beer_mapper
    @beer_brewery = @brewery.beers
  end
  
  def edit
    @brewery = Brewery.find_by_id(params[:id])
  end
  
  def update
    Brewery.update(params[:id], params[:brewery])
    redirect_to "/breweries"
  end
  
  def destroy
    Brewery.delete_all("id = '#{params[:id]}'")
    redirect_to "/breweries"
  end
  
end
