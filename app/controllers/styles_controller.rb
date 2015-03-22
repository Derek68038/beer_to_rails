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
  
end
