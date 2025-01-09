module Notifications
    class SMSNotification < NotificationStrategy
      def send_notification(user, ticket)
        # Use a gem like Twilio or Nexmo for SMS
        TwilioClient.new.send_sms(user.phone_number, ticket)
      end
    end
  end