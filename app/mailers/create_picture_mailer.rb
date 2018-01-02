class CreatePictureMailer < ApplicationMailer

  def create_picture_mail(picture)
    @picture = picture

    mail to: picture.user.email, subject: "Picture作成通知"
  end
end
