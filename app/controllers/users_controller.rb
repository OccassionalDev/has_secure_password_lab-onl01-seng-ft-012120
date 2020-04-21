class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, except: :home
  
  def home
  end 
  
  def new 
    @user = User.new
  end 
  
  def create 
    @user = User.create(user_params)
    
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    
    redirect_to controller: 'users', action: 'home'
  end 
  
  private 
  
  def user_params(*args) 
    params.require(:user).permit(:name, :password, :password_confirmation)
  end 
end 