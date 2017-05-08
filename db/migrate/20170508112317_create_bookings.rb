class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :trip, foreign_key: true
      t.string :name
      t.integer :seat_number

      t.timestamps
    end
  end
end
