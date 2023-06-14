class UserController < ApplicationController
  def view_profile
    @user = User.find(params[:user_id].to_i) # need users to view other users profiles actually
    #debugger
  end
  
  def edit_profile
    @user = User.find(Current.user.id)
  end

  def update_profile
    @user = User.find(Current.user.id)
    @user.username = params[:user][:username]
    @user.email    = params[:user][:email]
    @user.admin    = true  if params[:user][:admin] == "true"
    @user.admin    = false if params[:user][:admin] == "false"
    #debugger
    if !params[:user][:password].empty? && !params[:user][:password].empty?
      if params[:user][:password] == params[:user][:password_confirmation]
        if params[:user][:password].length > 6
          @user.password = params[:user][:password]
          @user.password_confirmation = params[:user][:password]
        end
      end
    end
    if @user.save
      flash[:notice] = 'User Account Successfully Updated!'
      redirect_to view_profile_path
    else
      flash[:alert] = 'Something Went wrong with the Editing of Your Account'
      render 'edit_profile'
    end
    #debugger
  end
  def users_list
    @users = User.all
  end
end