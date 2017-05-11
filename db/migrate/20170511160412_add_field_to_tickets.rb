class AddFieldToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :booked, :boolean, default: false
  end
end
