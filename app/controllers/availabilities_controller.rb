class AvailabilitiesController < ApplicationController
  before_action :set_availability, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?, only: [:index]
  before_action :ownership, only: [:new]
  # before_action :is_authenticated

  # GET /availabilities
  def index
    @availabilities = Availability.where(:active => true)
  end

  # GET /availabilities/1
  def show
    @space = Space.find(@availability.space_id)
  end

  # GET /availabilities/new
  def new
    # @space_id = params[:space_id]
    # @owner_id = Space.where(id:@space_id).user_id
    @availability = Availability.new
  end

  # GET /availabilities/1/edit
  def edit
    @space_id = @availability[:space_id]
    puts ">>>edit space_id: #{@space_id}"
  end

  # POST /availabilities
  def create
    @availability = Availability.new(availability_params)
      if @availability.save
        redirect_to space_path(@availability.space_id), notice: 'Availability was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /availabilities/1
  def update
      if @availability.update(availability_params)
        redirect_to @availability, notice: 'Availability was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /availabilities/1
  def destroy
    @availability.destroy
    redirect_to availabilities_url, notice: 'Availability was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_availability
      @availability = Availability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def availability_params
      params.require(:availability).permit(:space_id, :start, :end, :seat, :seat_price, :active)
    end

    def ownership
      @space_id = params[:space_id]
      @owner_id = Space.where(id:@space_id).as_json[0]['user_id']
      @user_id = @current_user.id

      if @user_id != @owner_id
        redirect_to root_path, notice: 'Access denied!'
      end
    end

    def is_admin?
      if @current_user.id != 1
        flash[:error] = "Admin priviledges denied"
        redirect_to root_path
      end
    end

end
