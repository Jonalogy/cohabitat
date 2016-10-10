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

    image_urls = []
    if params[:space][:workspace_image_url_1]
      uploaded_file_1 = params[:space][:workspace_image_url_1].path
      cloudinary_file_1 = Cloudinary::Uploader.upload(uploaded_file_1)
      image_urls << cloudinary_file_1["url"]
    else
      image_urls << ""
    end

    if params[:space][:workspace_image_url_2]
      uploaded_file_2 = params[:space][:workspace_image_url_2].path
      cloudinary_file_2 = Cloudinary::Uploader.upload(uploaded_file_2)
      image_urls <<  cloudinary_file_2["url"]
    else
      image_urls << ""
    end

    if params[:space][:workspace_image_url_3]
      uploaded_file_3 = params[:space][:workspace_image_url_3].path
      cloudinary_file_3 = Cloudinary::Uploader.upload(uploaded_file_3)
      image_urls << cloudinary_file_3["url"]
    else
      image_urls << ""
    end

    params[:space].delete(:workspace_image_url_1)
    params[:space].delete(:workspace_image_url_2)
    params[:space].delete(:workspace_image_url_3)

    @space = Space.new(space_params)

      if @space.save
        image_urls.each do |url|
          @space.images.create(attributes={url: url})
        end
        redirect_to @space, notice: 'Space was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /spaces/1
  def update
    image_urls = []
    current_image_urls = Image.where(space_id: params[:id]).order('created_at ASC')
    if params[:space][:workspace_image_url_1]
      uploaded_file_1 = params[:space][:workspace_image_url_1].path
      cloudinary_file_1 = Cloudinary::Uploader.upload(uploaded_file_1)
      image_urls << cloudinary_file_1["url"]
    else
      image_urls << current_image_urls[0].url
    end

    if params[:space][:workspace_image_url_2]
      uploaded_file_2 = params[:space][:workspace_image_url_2].path
      cloudinary_file_2 = Cloudinary::Uploader.upload(uploaded_file_2)
      image_urls <<  cloudinary_file_2["url"]
    else
      image_urls << current_image_urls[1].url
    end

    if params[:space][:workspace_image_url_3]
      uploaded_file_3 = params[:space][:workspace_image_url_3].path
      cloudinary_file_3 = Cloudinary::Uploader.upload(uploaded_file_3)
      image_urls << cloudinary_file_3["url"]
    else
      image_urls << current_image_urls[2].url
    end

    params[:space].delete(:workspace_image_url_1)
    params[:space].delete(:workspace_image_url_2)
    params[:space].delete(:workspace_image_url_3)

      if @space.update(space_params)

        @images = Image.where(space_id: params[:id])

        for i in (0...@images.length) do
          @images[i].update(attributes={url: image_urls[i]})
        end

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
      params.require(:space).permit(:user_id, :country_id, :area_id, :address, :postal, :space_name, :space_description, :space_type_id, :vibe_id, :amenity_ids => [])
    end
end
