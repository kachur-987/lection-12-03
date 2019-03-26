class PhotosController < ApplicationController
 before_action :authenticate_user!, except: [:index]
 before_action :set_photo, except: [:index, :create, :new]
  
  def index
    @photos = Photo.all
  end
  
  def new
    @photo = Photo.new
  end
  
  def show
    @photo = Photo.find(params[:id])
    respond_to do |format|
       format.js
     end
  end
  
  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to root_path
    else
      render 'new'
    end
    
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
   def photo_params
      params.require(:photo).permit(:category_id, :user_id, :title, {images: []})
   end
    
   def set_photo
      @photo = Photo.find(params[:id])
   end
end
