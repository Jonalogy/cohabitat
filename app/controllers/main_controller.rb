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
    # #
    # #   # puts "LOOK HERE THIS TIME FOR space ONLY >>> #{space.inspect} "
    # #   # puts "HERE HELLO space.is_a? Object >>>>> #{space.is_a? Object}"
    # #   # puts "LOOK HERE THIS TIME FOR space.vibe.name >>> #{space.vibe.name} "
    # #   # space.merge({:vibe => space.vibe.name, :space_type => space.space_type.name})
    # #   # space.merge!(vibe: space.vibe.name)
    # #   # space.merge!(space_type: space.space_type.name)
    # #   # space.inject({:vibe => space.vibe.name, :space_type => space.space_type.name})
    # end


    # respond_to do |format|
    #   format.json {
    #   render json: @customers, :include => {:store => {:include => {:biz_user => {:only => :company_name}}, :only => :store_name}}}
    # end


#     respond_to do |format|
#   format.json  {
#
#     render :json => @moulding.to_json(:include => [:material_costs])}
# end
#

# respond_to do |format|
#   format.json {
#     @spaces, :include => {:vibe  => {:only => :name }}
#     @spaces, :include => {:space_type  => {:only => :name }}
#     render :json => @spaces
# }
# end

# render :json => {:show_ring => @showring.as_json(
#   :include =>[:variations, :stones]
#   ), :other_rings => @other_rings}

render :json => @spaces, :include => [:vibe,:space_type, :images => {:only => :url }]


    #works to some extent
    # render :json => @spaces, :include => {:vibe  => {:only => :name }}, :include => {:space_type  => {:only => :name }}
  end

end
