class PicturesController < ApplicationController

  def index
    @pictures = Picture.all.order("id DESC")
    #@favorites = Favorite.all
    #@favorites = Favorite.find_by(user_id: current_user.id)
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    #キャッシュファイル名を渡す
    @picture.image.retrieve_from_cache! params[:cache][:image] if params[:cache].present?

    if @picture.save
      CreatePictureMailer.create_picture_mail(@picture).deliver
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.user_id = current_user.id
    if @picture.update(picture_params)
      redirect_to pictures_path
    else
      render 'edit'
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path, notice: '削除しました'
  end

  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    render 'new' if @picture.invalid?
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :caption, :user_id)
  end

end
