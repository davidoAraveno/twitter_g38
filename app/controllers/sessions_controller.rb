class SessionsController < ApplicationController
  http_basic_authenticate_with name:'david', password:'123', only: :images

  def index
    @images = Image.all.shuffle.take(9)
  end

  def new
    @user = User.new
    @images = Image.all.shuffle.take(1)
  end

  def create
    if params[:image].present?
      @image = Image.new(image_params)

      if @image.save
        redirect_to images_path, notice: 'imagen guardada con exito'
      else
        redirect_to images_path, notice: "error al intentar guardar"
      end
    elsif params[:user].present?
      @user = User.find_by_email(params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to i_user_path
      else
        redirect_to s_new_path
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_path
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
