class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
