class BeersController < ApplicationController
      
  def index
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @beer = Beer.order(:name).page(params[:page]).per_page(4)
    else
      redirect_to "/"
    end
  end
  
  def new
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @beer = Beer.new
    else
      redirect_to "/"
    end
  end
  
  def create
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @beer = Beer.new(params[:beer])
      if @beer.save
        redirect_to "/my_beer"
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
      @all_beer = Beer.where("name = '#{@beer.name}'").page(params[:page]).per_page(2)
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
      redirect_to "/my_beer"
    else
      redirect_to "/"
    end
  end
  
  def destroy
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      Beer.delete_all("id = '#{params[:id]}'")
      redirect_to "/my_beer"
    else
      redirect_to "/"
    end
  end
  
  def show_my_beer
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @beer = Beer.where("user_id = #{@current_user.id}")
      @beer_order = @beer.order(:name).page(params[:page]).per_page(4)
    else
      redirect_to "/"
    end
  end
  
end
