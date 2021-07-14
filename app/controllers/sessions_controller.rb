class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:'alert-success'] = "Logged in successfully!" # flash notice is used when redirecting to a different page.
      redirect_to user
    else
      flash.now[:'alert-danger'] = "Your login credentials were incorrect" # flash.now is used when re-rendering the same thing. Lots of details, I didn't follow. lol.
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:'alert-success'] = "Logged out"
    redirect_to root_path
  end

end