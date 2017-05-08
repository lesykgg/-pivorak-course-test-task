class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.references :trip, foreign_key: true
      t.string :name
      t.integer :seat_num

      t.timestamps
    end
  end
end
