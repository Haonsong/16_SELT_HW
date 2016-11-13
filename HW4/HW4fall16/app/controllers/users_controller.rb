class UsersController < ApplicationController
     
  def user_params
    params.require(:user).permit(:user_id, :email)
  end
  
#   def index
#     @users = User.all
#   end
  
  def new
    # default: render 'new' template
  end

  def create
    if User.find_by_user_id(user_params[:user_id])
        flash[:notice] = "Sorry this user-id is taken. Try again."
        redirect_to new_user_path
    else
        
        @user = User.create_user!(Hash['user_id' , user_params[:user_id],'email', user_params[:email]])
        flash[:notice] = "Welcome #{@user.user_id}. Your account has been created."
        redirect_to login_path
    end
  end
  
end
