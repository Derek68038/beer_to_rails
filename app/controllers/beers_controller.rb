class BeersController < ApplicationController
  
  def index
    @beer = Beer.order(:name)
  end
  
  def new
    @beer = Beer.new
  end
  
  def create
    @beer = Beer.new(params[:beer])
    if @beer.save
      redirect_to "/beers"
    else
      render "new"
    end
  end
  
end
