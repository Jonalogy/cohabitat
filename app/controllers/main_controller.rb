class MainController < ApplicationController
  before_action :is_authenticated, only:[:about]

  def index
  end

  def show
  end
  
end
