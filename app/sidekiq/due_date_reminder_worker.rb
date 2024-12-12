class DueDateReminderWorker
  include Sidekiq::Worker
    sidekiq_options retry: false

  def perform
    DueDateReminderService.send_due_date_reminders
  end
end
