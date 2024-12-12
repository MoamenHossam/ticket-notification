# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
["moamen"].each do |username|
    User.find_or_create_by!(email: "moamen.hossam@outlook.com",time_zone: "UTC",send_due_date_reminder: true,due_date_reminder_interval: 0,due_date_reminder_time: Time.current)
  end
  ["task1"].each do |ticket|
    user = User.first
    Ticket.find_or_create_by!(title:"task1",user: user,due_date: Time.current.to_date)
  end
