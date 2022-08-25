class ChangeStatusToConfirmedInReservations < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :status
    add_column :reservations, :confirmed, :boolean, default: false
  end
end
