class MainController < ApplicationController
  before_action :is_authenticated, only:[:about]

  def index
    @spaces = Space.all.order("id desc").limit(6)
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

  def search_filter
    @spaces = Space.where(country_id: params["country_id"], area_id: params["area_id"])
    if params["space_type_id"]
      @spaces = @spaces.where(space_type_id: params["space_type_id"])
    end
    if params["vibe_id"]
      @spaces = @spaces.where(vibe_id: params["vibe_id"])
    end
    if params["amenities_ids"]
      params["amenities_ids"].each do |amenity|
        @spaces = @spaces.includes(:amenities).where("amenities.id" => amenity)
      end
    end

    if params["start_date"] && params["end_date"]
      @spaces = @spaces.joins(:availabilities).where("availabilities.start <= ? AND availabilities.end >= ?", params["start_date"], params["end_date"])
    end
    render :json => @spaces, :include => [:vibe,:space_type, :images => {:only => :url }]
  end

  def schedule
    @user_id = @current_user.id
    @availabilities = Availability.where(id: @user_id)

    #Bookings that belongs to user_id
    @my_bookings = Booking.where(:user_id => @user_id)

    @space_ids = []
    @my_bookings.each do |booking|
      @space_ids.push(booking.space_id)
    end

    @spaces_hash = Hash.new(0)

    @space_ids.each do |space_id|
      space = Space.where(id: space_id).map(&:attributes)[0]
      @spaces_hash[space_id] = space['space_name']
      # @space_names.push(['space_name'])
    end #@space_ids.each

    ####Guest Bookings####
    @guest_bookings = Booking.joins(:user).where('start > ?', Date.today).where.not('user_id = ?', 1 ).select(:user_id, :id, :space_id, :start, :end, :seat)

    names = User.joins(:bookings).where('start > ?', Date.today).where.not('user_id = ?', 1).select(:id, :first_name).to_a

    @guest_names = Hash.new(0)
    names.each do |name|
      @guest_names[name.id] = name.first_name
    end

    space = Space.joins(:bookings).where('start > ?', Date.today).select(:id, :user_id, :space_name).to_a
    @space_names = Hash.new(0)
    space.each do |space|
      @space_names[space.user_id] = space.space_name
    end
    puts ">>>@space_names: #{@space_names}"

  end

end
