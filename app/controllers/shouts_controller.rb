class ShoutsController < ApplicationController
  before_action :set_shout, only: [:show, :edit, :update, :destroy]
  before_action :if_owner, only: [:edit, :update, :destroy]

  # GET /shouts
  def index
    @shouts = Shout.all
  end

  # GET /shouts/1
  def show
  end

  # GET /shouts/new
  def new
    @shout = Shout.new
  end

  # GET /shouts/1/edit
  def edit
  end

  # POST /shouts
  def create
    @shout = Shout.new(shout_params)

      if @shout.save
        redirect_to @shout, notice: 'Shout was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /shouts/1
  def update
      if @shout.update(shout_params)
        redirect_to space_path(@shout.space), notice: 'Shout was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /shouts/1
  def destroy
    @shout.destroy
    redirect_to shouts_url, notice: 'Shout was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def if_owner
      unless
        @shout = Shout.find(params[:id])
      end
    end


    def if_owner
      unless @shout.user_id == current_user.id
        flash.now[:danger] = "Not owner! No Access!"
        redirect_to root_path
      end
    end

    def set_shout
      @shout = Shout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shout_params
      params.require(:shout).permit(:user_id, :space_id, :message)
    end
end
