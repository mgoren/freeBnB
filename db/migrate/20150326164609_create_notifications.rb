class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :body
      t.integer :requester_id
      t.integer :user_id

      t.timestamps
    end
  end
end
