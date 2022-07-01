class Users::TextsController < ApplicationController

  def new
    if current_user
      current_user.update(receive_texts: true)
      binding.pry

    redirect_to '/dashboard'
    else
      flash[:notice] = "please sign up or sign in"
      redirect_to '/'
    end 
  end 


end 