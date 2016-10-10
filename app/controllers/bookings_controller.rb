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
    @availability = params[:avail_params]
      #puts ">>> Checking avail_params: #{@availability}"
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
    availability = Availability.find(avail_id)
    @avail_start = availability.start #date format
    @avail_end = availability.end
    @avail_seat = availability.seat

    @book_start = params[:booking][:start]
    # @book_end = params[:booking][:end]
    # @book_seat = params[:booking][:seat]

    # @booking = Booking.new(booking_params)
    # @book_start = @booking.start
    # @book_end = @booking.end
    # @book_seat = @booking.seat

    puts ">>>@book_start #{@book_start.class}"

    # if @book_start >= @avail_start && @book_end <= @avail_end && @book_seat <= @avail_seat
      puts ">>> Tatatatatatata...."
      #
      # if @booking.save
      #   redirect_to @booking, notice: 'Booking was successfully created.'
      # else
      #   render :new
      # end

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
