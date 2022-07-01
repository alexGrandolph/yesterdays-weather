class UsersController < ApplicationController

  def show
    if current_user

    else
      flash[:notice] = "please sign up or sign in"
      redirect_to '/'
    end 
  end 

  def new
    @user = User.new
  end 

  def create
    if params[:password] == params[:password_confirmation]
      @user = User.create(new_user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Welcome, #{@user.username}!"
        redirect_to "/dashboard"
      else
        flash[:error] = @user.errors.full_messages.join
        redirect_to "/register"    
      end 
    elsif new_user_params[:password] != new_user_params[:password_confirmation]
      flash[:error] = "Passwords do not match"
      redirect_to "/register"
    end 
  end 

  private
    def new_user_params
      params.permit(:username, :email, :phone, :password, :password_confirmation)
    end


end 