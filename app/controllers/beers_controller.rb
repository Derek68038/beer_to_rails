class BeersController < ApplicationController
      
  def index
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @beer = Beer.order(:name)
    else
      redirect_to "/"
    end
  end
  
  def new
    @beer = Beer.new
  end
  
  def create
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @beer = Beer.new(params[:beer])
      if @beer.save
        redirect_to "/beers"
      else
        render "new"
      end
    else
      redirect_to "/"
    end  
  end
  
  def show
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @beer = Beer.find_by_id(params[:id])
      @all_beer = Beer.where("name = '#{@beer.name}'")
    else
      redirect_to "/"
    end
  end
  
  def edit
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @beer = Beer.find_by_id(params[:id])
    else
      redirect_to "/"
    end
  end
  
  def update
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      Beer.update(params[:id], params[:beer])
      redirect_to "/beers"
    else
      redirect_to "/"
    end
  end
  
  def destroy
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      Beer.delete_all("id = '#{params[:id]}'")
      redirect_to "/beers"
    else
      redirect_to "/"
    end
  end
  
end
