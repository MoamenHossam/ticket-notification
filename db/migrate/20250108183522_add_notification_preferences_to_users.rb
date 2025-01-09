class AddNotificationPreferencesToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :preferred_notification_method, :string, default: "email"
  end
end
