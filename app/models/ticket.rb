class Ticket < ApplicationRecord
  belongs_to :user, class_name: 'User'

  validates :title, presence: true
  validates :user, presence: true
  validates :due_date, presence: true
end
