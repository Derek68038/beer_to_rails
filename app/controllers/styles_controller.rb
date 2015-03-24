class StylesController < ApplicationController
  
  def index
    @style = Style.order(:category)
  end
  
  def new
    @style = Style.new
  end
  
  def create
    if session[:user_id]
      if session[:user_id] == 1
        @current_user = User.find(session[:user_id])
        @style = Style.new(params[:style])
        if @style.save
          redirect_to "/styles"
        else
          render "new"
        end
      else
        redirect_to "/home"
      end
    else
      redirect_to "/"
    end
  end
  
  def show
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @style = Style.find_by_id(params[:id])
      @beer = Beer.where("style_id = #{params[:id]}") 
    else
      redirect_to "/"
    end    
  end
  
  def edit
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @style = Style.find_by_id(params[:id])
    else
      redirect_to "/"
    end
  end
  
  def update
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      Style.update(params[:id], params[:style])
      redirect_to "/styles"
    else
      redirect_to "/"
    end
  end
  
end
