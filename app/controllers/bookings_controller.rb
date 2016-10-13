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
    @avail_id = params[:avail_id] #Used to tag hidden_field with availability_id

    @availability = Availability.find(@avail_id)
    @seat_price = @availability.seat_price
    @space_id = params[:space_id]
    @space_name = Space.find(@space_id).space_name
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
    if @availability.active == false
      flash[:danger] = "Availability has expired, please select another."
      redirect_to space_path(@availability.space_id)
      return
    end
    @avail_start = @availability.start #date format
    @avail_end = @availability.end
    @avail_seat = @availability.seat

    @booking = Booking.new(booking_params)
    @booking.user_id = session[:user_id]

    @book_start = @booking.start
    @book_end = @booking.end
    @book_seat = @booking.seat

    puts ">>>(@avail_start , @avail_end) => (#{@avail_start} , #{@avail_end})"
    puts ">>>(@book_start , @book end) => (#{@book_start} , #{@book_end})"

    if @book_start >= @avail_start && @book_end <= @avail_end && @book_seat <= @avail_seat
      if @booking.save!
        Availability.update(avail_id,:active=>false) # @availability.active = false
        if @book_start == @avail_start && @book_end == @avail_end && @book_seat == @avail_seat
          flash[:success] =  'Booking was successfully created.'
          redirect_to schedule_path
        elsif @book_start == @avail_start && @book_end == @avail_end && @book_seat < @avail_seat
          #if booking's start, end matches availability listing's:
          seats_left =  @avail_seat - @book_seat
          @new_avail = @availability.dup #duplicates instance
          @new_avail.seat = seats_left
          @new_avail.active = true
          Availability.create!(@new_avail.attributes)
          flash[:success] =  'Booking was successfully created.'
          redirect_to schedule_path
        elsif (@book_start > @avail_start || @book_end < @avail_end) && @book_seat == @avail_seat
          if @book_start > @avail_start #When booking happens later than availability
            @new_avail_1 = @availability.dup #duplicates instance
            @new_avail_1.start = @avail_start
            @new_avail_1.end = (@book_start-1)
            @new_avail_1.active = true
            Availability.create!(@new_avail_1.attributes)
          end
          if @book_end < @avail_end
            @new_avail_2 = @availability.dup #duplicates instance
            @new_avail_2.start = (@book_end + 1)
            @new_avail_2.end = @avail_end
            @new_avail_2.active = true
            Availability.create!(@new_avail_2.attributes)
          end
          flash[:success] =  'Booking was successfully created.'
        elsif (@book_start > @avail_start || @book_end < @avail_end) && @book_seat < @avail_seat
          seats_left =  @avail_seat - @book_seat
          @new_avail = @availability.dup #duplicates instance
          @new_avail.seat = seats_left
          @new_avail.active = true
          Availability.create!(@new_avail.attributes)

          if @book_start > @avail_start #When booking happens later than availability
            @new_avail_1 = @availability.dup #duplicates instance
            @new_avail_1.start = @avail_start
            @new_avail_1.end = (@book_start-1)
            @new_avail_1.active = true
            Availability.create!(@new_avail_1.attributes)
          end
          if @book_end < @avail_end
            @new_avail_2 = @availability.dup #duplicates instance
            @new_avail_2.start = (@book_end + 1)
            @new_avail_2.end = @avail_end
            @new_avail_2.active = true
            Availability.create!(@new_avail_2.attributes)
          end
          flash[:success] =  'Booking was successfully created.'
        end


        # make charge when booking made
        Stripe.api_key = ENV["stripe_secret_key"]
          # Get the credit card details submitted by the form
          token = params[:stripeToken]
          @price = (params[:booking][:total_price].to_i) *100
        # Create a charge: this will charge the user's card
        begin
          charge = Stripe::Charge.create(
            :amount => @price,
            :currency => "sgd",
            :source => token,
            :description => "Co-Habitat Booking id: #{@booking.id}"
          )
        rescue Stripe::CardError => e
          # The card has been declined
        end

          end # end of if @booking.save
        elsif @book_start < @avail_start

          flash[:danger] = 'Booking date cannot be earlier than listing\'s start date, please try again'
          redirect_to space_path(@availability.space_id)

        elsif @book_end > @avail_end

          flash[:danger] =  'Booking date must not end later than listing\'s end date, please try again'

          redirect_to space_path(@availability.space_id)


        elsif @book_seat > @avail_seat
          flash[:danger] =  "Listing consists only #{@avail_seat} seats. Please contact host for further assistance"
          redirect_to space_path(@availability.space_id)

        else
          flash[:danger] =  'Oops, booking parameters may be faulty, please try again'
          redirect_to space_path(@availability.space_id)
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
      params.require(:booking).permit(:space_id, :availability_id, :start, :end, :seat, :total_price, :stripeToken)
    end

end
