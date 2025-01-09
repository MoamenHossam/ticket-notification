module Notifications
    class EmailNotification < NotificationStrategy
      def send_notification(user, ticket)
        NotificationMailer.notification_email(user, ticket).deliver_now
      end
    end
  end