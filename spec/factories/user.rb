FactoryBot.define do
    factory :user do
        name {Faker::Name.name}
        email { Faker::Internet.unique.email }
        time_zone {'UTC'}
        send_due_date_reminder{true}
        due_date_reminder_interval{1}
        due_date_reminder_time{Time.now}
    end
  end