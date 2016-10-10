class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :edit, :update, :destroy]

  # GET /spaces
  def index
    @spaces = Space.all
  end

  # GET /spaces/1
  def show
  end

  # GET /spaces/new
  def new
    @space = Space.new
  end

  # GET /spaces/1/edit
  def edit
  end

  # POST /spaces
  def create
    @space = Space.new(space_params)

      if @space.save
        redirect_to @space, notice: 'Space was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /spaces/1
  def update
      if @space.update(space_params)
        redirect_to @space, notice: 'Space was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /spaces/1
  def destroy
    @space.destroy
    redirect_to spaces_url, notice: 'Space was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space
      @space = Space.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_params
      params.require(:space).permit(:user_id, :country_id, :area_id, :address, :postal, :space_name, :space_description, :space_type_id, :vibe_id, :amenity_id)
    end
end
