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
    puts "LOOK HERE FOR params >>>>>> #{params.inspect}"

    @spaces = Space.where(country_id: params["country_id"], area_id: params["area_id"])
    if params["space_type_id"]
      @spaces = @spaces.where(space_type_id: params["space_type_id"])
    end
    if params["vibe_id"]
      @spaces = @spaces.where(vibe_id: params["vibe_id"])
    end
    if params["amenities_ids"]
      params["amenities_ids"].each do |amenity|
        puts "amenity >>>>>>>>>>>> #{amenity}"
        # @spaces = @spaces.where(:space_id => Amenity.where(amenity_id: amenity))
        # puts "LOOK HERE >>>>>>>>>> FIRST ONE #{@spaces.joins(amenities: :spaces)[0].inspect}"
        # @spaces = @spaces.joins(amenities: :spaces).where(space_id: {amenity_id: amenity})
        # puts "@spaces.includes(:amenities) >>>>>>>>>>>> #{@spaces.includes(:amenities).inspect}"
        # @spaces = @spaces.includes(:amenities).where(amenity_id: amenity)
        # User.where(:username => "Paul").includes(:domains).where("domains.name" => "paul-domain").limit(1)
        @spaces = @spaces.includes(:amenities).where("amenities.id" => amenity)
      end
    end

    puts "LOOK HERE FOR SPACES FOUND >>>>>> #{@spaces.inspect}"
    # @spaces.each do |space|
    #   space[:vibe_name] = space.vibe.name
    #   space[:space_type_name] = space.space_type.name
    #
    #   # puts "LOOK HERE THIS TIME FOR space ONLU >>> #{space.inspect} "
    #   # puts "HERE HELLO space.is_a? Object >>>>> #{space.is_a? Object}"
    #   # puts "LOOK HERE THIS TIME FOR space.vibe.name >>> #{space.vibe.name} "
    #   # space.merge({:vibe => space.vibe.name, :space_type => space.space_type.name})
    #   # space.merge!(vibe: space.vibe.name)
    #   # space.merge!(space_type: space.space_type.name)
    #   # space.inject({:vibe => space.vibe.name, :space_type => space.space_type.name})
    # end

    render :json => @spaces
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

    @guest_bookings = Booking.where.not(user_id: @current_user.id).to_a

    # @guests = Hash.new(0)
    # @guest_bookings.each do |guest_booking|
    #   @guests.[guest_booking.id] = guest_booking.user_id
    #   guest_booking.user_id
    # end #@guest_bookings.each

    puts ">>>Checking @guests: #{@guests}"


    # puts ">>>Check @guest_bookings: #{@guest_bookings.inspect}"

  end

end
