module Notifications
    class NotificationFactory
      def self.for_user(user)
        case user.preferred_notification_method
        when "email"
          EmailNotification.new
        when "sms"
          SMSNotification.new
        when "push"
          PushNotification.new
        else
          raise "Unsupported notification method: #{user.preferred_notification_method}"
        end
      end
    end
  end
  