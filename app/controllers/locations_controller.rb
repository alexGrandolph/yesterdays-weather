class LocationsController < ApplicationController

  def new
    if current_user
    else
      flash[:notice] = "please sign up or sign in"
      redirect_to '/'
    end 
  end 

  def create 
    if current_user
      raw_location = params[:location]
      location = raw_location.delete(" ")

      new_location = Location.create!(user: current_user, name: location)
      new_location.save
      redirect_to '/dashboard'
    else
      flash[:notice] = "please sign up or sign in"
      redirect_to '/'
    end 
  end 

end 