class RemoveApprovedFromBooking < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :approved, :boolean
  end
end
