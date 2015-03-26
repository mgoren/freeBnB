class AddListingIdsAndReadToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :read, :boolean
    add_column :notifications, :listing_id, :integer
  end
end
