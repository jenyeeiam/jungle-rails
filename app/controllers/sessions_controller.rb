class SessionsController < ApplicationController

  def create
    user = User.find_by email: (params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to [:root], notice: "Welcome #{user.first_name}"
    else
      redirect_to login_path, notice: "Did you fill in all the fields?"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Thanks for shopping!"
    redirect_to root_path
  end

end
