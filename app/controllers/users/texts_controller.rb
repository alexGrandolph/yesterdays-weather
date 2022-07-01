class Users::TextsController < ApplicationController

  def new
    if current_user
      current_user.update(receive_texts: true)
      current_user.send_daily_sms(current_user)
      current_user.some_method
    redirect_to '/dashboard'
    else
      flash[:notice] = "please sign up or sign in"
      redirect_to '/'
    end 
  end 


end 