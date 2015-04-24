class UsersController < ApplicationController
  
  include UsersHelper
    
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by_username(params[:user][:username])
    if @user == nil
      @user = User.new(username: "#{params[:user][:username]}", password: BCrypt::Password.create(params[:user][:password]))      
      if params[:user][:password] == ""
        redirect_to "/not_allowed"
      elsif @user.save
        session[:user_id] = @user.id
        redirect_to "/home"
      else
        render "new"
      end
    else
      crypt_password = BCrypt::Password.new(@user.password)
      if crypt_password == params[:user][:password]
        binding.pry
        session[:user_id] = @user.id
        redirect_to "/home"
      else 
        redirect_to "/not_allowed"
      end
    end
  end
  
  def home
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      user = User.find_by_id(session[:user_id])
      @name = user.username
    else
      redirect_to "/"
    end 
  end
  
end
