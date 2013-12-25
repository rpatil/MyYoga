class UserSessionsController < ApplicationController
  
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      user = getUserDetails(params[:user_session][:email])
      flash[:notice] = "Login successful!"
      session[:UserFullName] = "#{user.first_name} #{user.last_name}"      
      session[:UserName] = user.username
      session[:UserEmail] = user.email
      session[:LoggedInUserID] = user.id
      redirect_to "/Index", :notice => "Login successful!"
    else
      flash[:notice] = "failure!"     
      redirect_to "/SignIn", :notice => "Wrong Credentials"
    end
  end

  def destroy
    reset_session
    redirect_to '/SignIn', :notice => "Logout successful!"    
  end
  
end