class StylesController < ApplicationController
  
  def index
    @style = Style.order(:category)
  end
  
  def new
    @style = Style.new
  end
  
  def create
    @style = Style.new(params[:style])
    if @style.save
      redirect_to "/styles"
    else
      render "new"
    end
  end
  
  def show
    @style = Style.find_by_id(params[:id])
    @beer = Beer.where("style_id = #{params[:id]}")     
  end
  
  def edit
    @style = Style.find_by_id(params[:id])
  end
  
  def update
    Style.update(params[:id], params[:style])
    redirect_to "/styles"
  end
  
end
