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
  
  def show
    @beer = Beer.find_by_id(params[:id])
    @all_beer = Beer.where("name = '#{@beer.name}'")
  end
  
  def edit
    @beer = Beer.find_by_id(params[:id])
  end
  
  def update
    Beer.update(params[:id], params[:beer])
    redirect_to "/beers"
  end
  
  def destroy
    Beer.delete_all("id = '#{params[:id]}'")
    redirect_to "/beers"
  end
  
end
