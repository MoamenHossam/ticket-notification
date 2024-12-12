class NotificationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.notification_email.subject
  #
  def notification_email(user,ticket)
    @user = user
    @greeting = "Hi"

    mail(
      to: @user.email,
      subject:"Ticket due date notification"
    )
  end
end
