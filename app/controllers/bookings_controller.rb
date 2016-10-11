class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  # before_action :is_authenticated

  # GET /bookings
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  def show
  end

  # GET /bookings/new
  def new
    @availability = params[:avail_params] #Used to tag hidden_field with availability_id
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  def create
    # puts ">>>Test params[:booking]=> #{params[:booking].inspect}"
    # puts ">>>Test params[:booking][:start]=> #{params[:booking][:start].inspect}"
    # puts ">>>Test params[:booking][:end]=> #{params[:booking][:end].inspect}"
    # puts ">>>Test params[:booking][:availability_id]=> #{params[:booking][:availability_id].inspect}"
    avail_id = params[:booking][:availability_id]
    @availability = Availability.find(avail_id)
    @avail_start = @availability.start #date format
    @avail_end = @availability.end
    @avail_seat = @availability.seat
    puts ">>>(@avail_start , @avail_end) => (#{@avail_start} , #{@avail_end})"

    @booking = Booking.new(booking_params)
    @book_start = @booking.start
    @book_end = @booking.end
    @book_seat = @booking.seat
    puts ">>>(@book_start , @book end) => (#{@book_start} , #{@book_end})"

    if @book_start >= @avail_start && @book_end <= @avail_end && @book_seat <= @avail_seat
      if @booking.save
        Availability.update(avail_id,:active=>false) # @availability.active = false
        if @book_start == @avail_start && @book_end == @avail_end && @book_seat == @avail_seat
          #if booking's start, end matches availability listing's:
        elsif @book_start > @avail_start && @book_end < @avail_end && @book_seat < @avail_seat
          seats_left =  @avail_seat - @book_seat
          if @book_start > @avail_start #When booking happens later than availability
            @new_avail = @availability.dup #duplicates instance
            @new_avail.start = @avail_start
            @new_avail.end = (@book_start-1)
            @new_avail.seat = seats_left
            Availability.create!(@new_avail.attributes)
          end




        end
        redirect_to @booking, notice: 'Booking was successfully created.'
        # else
        #   redirect_to availabilities_path
      end # end of if @booking.save
    elsif @book_start < @avail_start
      redirect_to availabilities_path, notice: 'Booking date cannot be earlier than listing\'s start date, please try again'
    elsif @book_end > @avail_end
      redirect_to availabilities_path, notice: 'Booking date must not end later than listing\'s end date, please try again'
    elsif @book_seat > @avail_seat
      redirect_to availabilities_path, notice: "Listing consists only #{@avail_seat} seats. Please contact host for further assistance"
    else
      redirect_to availabilities_path, notice: 'Oops, booking parameters may be faulty, please try again'
    end

  end #create

  # PATCH/PUT /bookings/1
  def update
      if @booking.update(booking_params)
        redirect_to @booking, notice: 'Booking was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:space_id, :availability_id, :start, :end, :seat, :total_price)
    end

    def date_check

    end
end
