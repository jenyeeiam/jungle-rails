class SessionsController < ApplicationController

  def create
    user = User.find_by email: (params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to [:root], notice: "You have successfully logged in"
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to '/login'
  end

end
