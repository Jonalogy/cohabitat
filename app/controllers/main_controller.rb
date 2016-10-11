class MainController < ApplicationController
  before_action :is_authenticated, only:[:about]

  def index
    @current_user = User.find_by_id(session[:user_id])
    puts ">>>@current_user: #{@current_user.inspect}"
  end

  def show
    if params[:space_area_id] != ""
      @spaces = Space.where(country_id: params[:space_country_id], area_id: params[:space_area_id]).order("RANDOM()")
    else
      flash[:danger] = "Please select country."
      redirect_to root_path, notice: 'Please select country.'
    end
  end

end
