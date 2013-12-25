class ApplicationController < ActionController::Base
  protect_from_forgery 

  #filter_parameter_logging :password, :password_confirmation # there are underscores :-| 

  helper_method :current_user_session, :current_user

  def current_user_full_name
      return session[:UserFullName]
  end
  
  def current_user_name
      return session[:UserName]
  end
  
  def current_user_email
      return session[:UserEmail]
  end
  
  def current_user_id
      return session[:LoggedInUserID]
  end
  
  def getUserDetails(email)
    return User.find_by_email(email)
  end
  
  private
   
    def current_user_session
      return current_user_name if defined?(current_user_name)
      #=> Find by Remember Token @current_user_session = UserSession.find
    end

    def require_user
      logger.debug "ApplicationController::require_user"
      unless current_user_session
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to "/SignIn"
        return false
      end
    end

    def require_no_user
      logger.debug "ApplicationController::require_no_user"
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
       # redirect_to home_index_path
        return false
      end
    end

    def store_location
      #session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end
