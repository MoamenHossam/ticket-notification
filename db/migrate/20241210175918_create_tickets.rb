class CreateTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.date :due_date, null: false
      t.string :status
      t.integer :progress

      t.timestamps
    end
    add_index :tickets, :due_date
  end
end
