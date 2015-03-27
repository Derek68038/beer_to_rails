class BreweriesController < ApplicationController

  include BreweriesHelper
  
  def index
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @brewery = Brewery.order(:place).page(params[:page]).per_page(12)
    else
      redirect_to "/"
    end
  end
  
  def new
    @brewery = Brewery.new
  end
  
  def create
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @brewery = Brewery.new(params[:brewery])
      if @brewery.save
        redirect_to "/breweries"
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
      beer_mapper
      @brewery = Brewery.find_by_id(params[:id])
      @beer_brewery = @brewery.beers
    else
      redirect_to "/"
    end
  end
  
  def edit
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @brewery = Brewery.find_by_id(params[:id])
    else
      redirect_to "/"
    end
  end
  
  def update
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      Brewery.update(params[:id], params[:brewery])
      redirect_to "/breweries"
    else
      redirect_to "/"
    end
  end
  
  def destroy
    if session[:user_id]
      if session[:user_id] == 1
        @current_user = User.find(session[:user_id])
        Brewery.delete_all("id = '#{params[:id]}'")
        redirect_to "/breweries"
      else
        flash[:notice] = "Sorry, you must be an administrator to complete this action."
        redirect_to "/breweries"
      end
    else
      redirect_to "/"
    end
  end
  
end
