module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
    session[:cart] = Hash.new
  end

  def add_to_cart
    if session[:cart].nil? 
      session[:cart] = Hash.new
    end
    if(session[:cart].has_key?(params[:id]))
      session[:cart][params[:id]] += 1
    else
      session[:cart][params[:id]] = 1
    end
    redirect_to shopping_path
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def sign_out
    current_user = nil
    cookies.delete(:remember_token)
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in."
    end
  end

  def redirect_back_or_default(default)
    if params[:session][:return_to].empty?
      redirect_to default
    else
      redirect_to params[:return_to]
      params[:session][:return_to] = nil
    end
  end
end
