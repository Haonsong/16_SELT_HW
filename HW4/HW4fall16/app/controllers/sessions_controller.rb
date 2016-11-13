class SessionsController < ApplicationController
    
   def log_params
     params.require(:user).permit(:user_id, :email)
   end
    
  def new
    
  end
  
  def create
    @user = log_params[:user_id]
    @email = log_params[:email]
    if (@cur_user = User.authenticate @user,@email)
        session[:session_token] = @cur_user.session_token
        flash[:notice] = "You are logged in as #{@user}"
        redirect_to movies_path
    else
        flash[:notice] = "Invalid user-id/e-mail combination."
        redirect_to login_path
    end
  end
  
  def destroy
      reset_session
      redirect_to movies_path
  end
end
