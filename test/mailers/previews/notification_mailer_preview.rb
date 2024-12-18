# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/notification_email
  def notification_email
    user = User.first
    NotificationMailer.notification_email(user)
  end
end
