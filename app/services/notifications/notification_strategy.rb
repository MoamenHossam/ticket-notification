module Notifications
    class NotificationStrategy
      def send_notification(user, message)
        raise NotImplementedError, "Subclasses must implement `send_notification`."
      end
    end
  end
  