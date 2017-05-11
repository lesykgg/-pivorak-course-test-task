class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.references :trip, foreign_key: true
      t.string :name
      t.integer :seatnum
      t.string :from
      t.string :to
      t.timestamps
    end
  end
end
