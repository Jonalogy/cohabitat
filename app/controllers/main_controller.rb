class MainController < ApplicationController
  before_action :is_authenticated, only:[:about]

  def index
    @current_user = User.find_by_id(session[:user_id])
    puts ">>>@current_user: #{@current_user.inspect}"
  end

  def show
  end

end
