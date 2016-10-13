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



    # puts ">>>Check @my_bookings: #{@my_bookings.inspect}"
    # puts ">>>Check @spaces: #{@spaces}"
    # puts ">>>Checking hash_@spaces: #{@spaces_hash}"

    #Query all spaces belonging to user and converts result to array format
    my_spaces = Space.where(user_id: @current_user.id).to_a

    #Array will hold all belonging space_ids
    @my_space_ids = []

    #iterates thru my_spaces array and pushes only space_id into @my_space_ids[]
    my_spaces.each do |my_space|
      @my_space_ids.push(my_space.id)
    end
    puts ">>>Check @my_space_ids: #{@my_space_ids}"

    @guest_bookings = []
    #For each space_id, query for booking
    @my_space_ids.each do |my_space_id|
       user_x = Booking.where.not(user_id: @user_id).where(space_id: my_space_id).to_a

       user_x.each do |x|
         @guest_bookings.push(x)
      end
    end

    puts ">>>Checking #{@guest_bookings.inspect}"

    # @guest_bookings = Booking.where.not(user_id: @user_id).to_a
    #
    # @guests = Hash.new(0)
    # @guest_bookings.each do |guest_booking|
    #   @guests.[guest_booking.id] = guest_booking.user_id
    #   guest_booking.user_id
    # end #@guest_bookings.each
    #
    # puts ">>>Checking @guests: #{@guests}"

    # puts ">>>Check @guest_bookings: #{@guest_bookings.inspect}"

  end

end
