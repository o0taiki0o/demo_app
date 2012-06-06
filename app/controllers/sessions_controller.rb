class SessionsController < ApplicationController
  def new
  end

  def create
     user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      if current_user.user_type == 1
        redirect_to shopping_path
      else
        redirect_to orders_path
      end
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
   sign_out
    redirect_to root_path
  end
end
