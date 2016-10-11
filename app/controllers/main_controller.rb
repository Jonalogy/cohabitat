class MainController < ApplicationController
  before_action :is_authenticated, only:[:about]

  def index
  end

  def show
    params[:space_country_id]
    params[:space_area_id]
    if params[:space_area_id] != ""
      @spaces = Space.where(country_id: params[:space_country_id], area_id: params[:space_area_id])
    elsif params[:space_country_id] != "Select a Country"
      @spaces = Space.where(country_id: params[:space_country_id])
    else
      flash[:danger] = "Please select country."
      redirect_to root_path, notice: 'Please select country.'
    end
  end

end
