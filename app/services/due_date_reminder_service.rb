class DueDateReminderService

    def self.send_due_date_reminders

      # Fetch users with active reminders and at least one ticket
      users = User.joins(:tickets)
      .with_active_reminders
      .find_each(batch_size: 100) do |user|
        send_notifications_for_user(user)
      end
    end
  
    private
  

  
    def self.send_notifications_for_user(user)
      Rails.logger.info "sending notification to user #{user.email}"
      user.tickets.each do |ticket|
        next unless ticket_due_for_reminder?(ticket, user)
        begin
          NotificationMailer.notification_email(user, ticket).deliver_now
        rescue StandardError => e
          Rails.logger.error "Error sending notification for user #{user.id} and ticket #{ticket.id}: #{e.message}"
        end
        # create_notification_record(user, ticket)
      end
    end
  
    def self.ticket_due_for_reminder?(ticket, user)
      #calculate due date based on the reminder interval for user
      reminder_time = ticket.due_date - user.due_date_reminder_interval
      #compare due date with current date and compare timezones time to due date time
      reminder_time.to_date == Time.current.to_date and DateTime.now.in_time_zone(user.time_zone).hour == user.due_date_reminder_time.hour
    end
  
  end
  