require 'rails_helper'

RSpec.describe DueDateReminderService do
  describe '.ticket_due_for_reminder?' do
    let(:user) { create(:user) }

    context 'when ticket is due for reminder' do
      it 'returns true when ticket is due for reminder' do
        ticket = create(:ticket, due_date: Date.today+1.day)
        user.update!(due_date_reminder_interval: 1, due_date_reminder_time: Time.current)
      
        expect(DueDateReminderService.ticket_due_for_reminder?(ticket, user)).to be true
      end
    end

    context 'when ticket is not due for reminder' do
      it 'returns false when due date is too early' do
        ticket = create(:ticket, due_date: Time.current - 1.day)
        user.update!(due_date_reminder_interval: 1, due_date_reminder_time: Time.current)

        expect(DueDateReminderService.ticket_due_for_reminder?(ticket, user)).to be false
      end

      it 'returns false when due date is too late' do
        ticket = create(:ticket, due_date: Time.current + 2.days)
        user.update!(due_date_reminder_interval: 1, due_date_reminder_time: Time.current)

        expect(DueDateReminderService.ticket_due_for_reminder?(ticket, user)).to be false
      end

      it 'returns false when reminder time doesn\'t match' do
        ticket = create(:ticket, due_date: Time.current + 1.day)
        user.update!(due_date_reminder_interval: 1, due_date_reminder_time: Time.current+2.hours)

        expect(DueDateReminderService.ticket_due_for_reminder?(ticket, user)).to be false
      end

      it 'handles different time zones' do

        user.update!(time_zone: 'Eastern Time (US & Canada)')

      end
    end
  end
end