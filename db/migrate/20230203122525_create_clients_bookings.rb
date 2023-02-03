class CreateClientsBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :clients_bookings do |t|
      t.references :client, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
