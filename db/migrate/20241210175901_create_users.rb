class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false
      t.boolean :send_due_date_reminder, null: false
      t.integer :due_date_reminder_interval, null: false
      t.time :due_date_reminder_time, null: false
      t.string :time_zone, null: false
      t.timestamps
    end
    add_index :users, :send_due_date_reminder
  end
end
