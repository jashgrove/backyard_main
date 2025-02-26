class AddApprovedToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :approved, :boolean, default: false
  end
end
