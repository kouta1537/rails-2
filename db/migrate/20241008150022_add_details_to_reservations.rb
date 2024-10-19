class AddDetailsToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :check_in_date, :date
    add_column :reservations, :check_out_date, :date
    add_column :reservations, :guest_count, :integer
  end
end
