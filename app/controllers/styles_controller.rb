class StylesController < ApplicationController
  
  def index
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @style = Style.order(:category).page(params[:page]).per_page(12)
    else
      redirect_to "/"
    end
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
        flash[:notice] = "Sorry, you must be an administrator to complete this action."
        redirect_to "/styles"
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
  
  def destroy
    if session[:user_id]
      if session[:user_id] == 1
        @current_user = User.find(session[:user_id])
        Style.delete_all("id = '#{params[:id]}'")
        redirect_to "/styles"
      else
        flash[:notice] = "Sorry, you must be an administrator to complete this action."
        redirect_to "/styles"
      end
    else
      redirect_to "/"
    end
  end
  
end
