module UsersHelper
  
  def logout
    session.clear
    redirect_to "/"
  end
  
end
