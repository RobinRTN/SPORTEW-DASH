class CreateUsersBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :users_bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
