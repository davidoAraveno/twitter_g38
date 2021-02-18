class SessionsController < ApplicationController
  http_basic_authenticate_with name:'david', password:'123', only: :images

  def index
    @images = Image.all.shuffle.take(10)
  end

  def new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to images_path, notice: 'imagen guardada con exito'
    else
      redirect_to images_path, notice: "error al intentar guardar"
    end
  end

  def destroy
  end

  def images
    @image = Image.new
    @images = Image.all
  end

  private

  def image_params
    params.require(:image).permit(:url)
  end

end
