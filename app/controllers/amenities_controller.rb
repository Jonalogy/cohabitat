class AmenitiesController < ApplicationController
  before_action :set_amenity, only: [:show, :edit, :update, :destroy]

  # GET /amenities
  def index
    @amenities = Amenity.all
  end

  # GET /amenities/1
  def show
  end

  # GET /amenities/new
  def new
    @amenity = Amenity.new
  end

  # GET /amenities/1/edit
  def edit
  end

  # POST /amenities
  def create
    @amenity = Amenity.new(amenity_params)

      if @amenity.save
        redirect_to @amenity, notice: 'Amenity was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /amenities/1
  def update
      if @amenity.update(amenity_params)
        redirect_to @amenity, notice: 'Amenity was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /amenities/1
  def destroy
    @amenity.destroy
      redirect_to amenities_url, notice: 'Amenity was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amenity
      @amenity = Amenity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def amenity_params
      params.require(:amenity).permit(:name)
    end
end
