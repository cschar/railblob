module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end


  def remember(user)
    user.remember

    #securely encrypt cookie before placing in browser
    cookies.permanent.signed[:user_id] = user.id

    # This pattern of setting a cookie that expires 20 years in the future
    # is so common that Rails has a special permanent method for it
    #cookies[:remember_token] = { value:   remember_token,
    #                             expires: 20.years.from_now.utc }
    cookies.permanent[:remember_token] = user.remember_token
    #remember_token is already a SecureRandom base64, no need for encryption
    #w permanent.signed

  end

  # Returns the user corresponding to the remember token cookie.
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    elsif cookies.signed[:user_id]
      user = User.find_by(id: cookies.signed[:user_id])
      #MATCH against remember_digest in db with remember_token
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end



  # Forgets a persistent session.
  def forget(user)
    user.forget  # set remember_digest to nil in DB
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end


end
