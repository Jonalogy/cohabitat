class VibesController < ApplicationController
  before_action :set_vibe, only: [:show, :edit, :update, :destroy]

  # GET /vibes
  def index
    @vibes = Vibe.all
  end

  # GET /vibes/1
  def show
  end

  # GET /vibes/new
  def new
    @vibe = Vibe.new
  end

  # GET /vibes/1/edit
  def edit
  end

  # POST /vibes
  def create
    @vibe = Vibe.new(vibe_params)

      if @vibe.save
        redirect_to @vibe, notice: 'Vibe was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /vibes/1
  def update
      if @vibe.update(vibe_params)
        redirect_to @vibe, notice: 'Vibe was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /vibes/1
  def destroy
    @vibe.destroy
    redirect_to vibes_url, notice: 'Vibe was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vibe
      @vibe = Vibe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vibe_params
      params.require(:vibe).permit(:name)
    end
end
