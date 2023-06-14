class SessionsController < ApplicationController

  def new_form
    if logged_in?
      flash[:notice] = 'You are already logged in'
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def new_session
    info  = user_params
    user = User.where(username: info[:username]).first
    if user && user.authenticate(info[:password])
      session[:user_id] = user.id
      set_current_user
      #debugger
      flash[:notice] = "Log in Successful #{Current.user.username}"
      redirect_to root_path
    else
      flash[:alert] = 'Log in UNSUCCESSFUL'
      render 'new_form'
    end
  end

  def destroy_session
    session[:user_id] = nil
    flash[:notice] = 'Successfully logged out'
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username,:password)
  end
end