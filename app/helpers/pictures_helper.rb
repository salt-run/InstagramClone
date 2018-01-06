module PicturesHelper

  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_pictures_path
    else
      picture_path
    end
  end

  def user_favorite_picture?(picture_id)
    if current_user.favorites.present?
      current_user.favorites.find_by(picture_id: picture_id)
    else
      nil
    end
  end

end
