class SpaceTypesController < ApplicationController
  before_action :set_space_type, only: [:show, :edit, :update, :destroy]

  # GET /space_types
  def index
    @space_types = SpaceType.all
  end

  # GET /space_types/1
  def show
  end

  # GET /space_types/new
  def new
    @space_type = SpaceType.new
  end

  # GET /space_types/1/edit
  def edit
  end

  # POST /space_types
  def create
    @space_type = SpaceType.new(space_type_params)

      if @space_type.save
        redirect_to @space_type, notice: 'Space type was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /space_types/1
  def update
      if @space_type.update(space_type_params)
        redirect_to @space_type, notice: 'Space type was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /space_types/1
  def destroy
    @space_type.destroy
    redirect_to space_types_url, notice: 'Space type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space_type
      @space_type = SpaceType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_type_params
      params.require(:space_type).permit(:name)
    end
end
