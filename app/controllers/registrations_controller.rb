class RegistrationsController < ApplicationController
   
   def new_user
      @user = User.new
   end

   def add_user
      @user = User.new(user_params)
      if @user.save
         session[:user_id] = @user.id
         flash[:notice] = 'User account successfully created'
         #redirect_to sign_in_path
         redirect_to root_path
      else
         flash[:alert] = 'Somethinbg went wrong'
         render 'new_user'
      end
   end

   private
   def user_params
      params.require(:user).permit(:username,:email,:password,:password_confirmation)
   end
end