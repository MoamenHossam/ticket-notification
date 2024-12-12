class User < ApplicationRecord
    has_many :tickets, foreign_key: :user_id

    scope :with_active_reminders, -> { where(send_due_date_reminder: true) }
    
    validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :send_due_date_reminder, inclusion: [true, false]
    validates :due_date_reminder_interval, numericality: { only_integer: true}
    validates :due_date_reminder_time, presence: true
    validates :time_zone, presence: true
  end