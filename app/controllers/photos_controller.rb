class PhotosController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @photo = Photo.new
  end

  def show
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @photo = @user.photos.new(photo_params)
    if @photo.save
      session[:photo_id] = @photo.id
      flash[:notice] = "photo was added"
      redirect_to user_photos_path
    else
      render 'new'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @user = User.find(params[:user_id])
    if current_user.id == @user.id
      
      if @photo.destroy
        flash[:notice] = "The photo was deleted."
        redirect_to user_photo_path
      end
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:photo, :user_id)
    end
end