# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
  for a in 1..5 do
    user = User.find_or_create_by!(name: Faker::Name.name ,email: Faker::Internet.email,time_zone: "UTC",send_due_date_reminder: true,due_date_reminder_interval: 0,due_date_reminder_time: Time.now)
    Ticket.find_or_create_by!(title:"task1",user: user,due_date: Time.current.to_date)
  end
  # ["task1"].each do |ticket|
  #   user = User.first
  #   Ticket.find_or_create_by!(title:"task1",user: user,due_date: Time.current.to_date)
  # end
