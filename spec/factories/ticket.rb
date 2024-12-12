FactoryBot.define do
    factory :ticket do
        title {'task1'}
        due_date{Date.today}
        association :user
    end
  end