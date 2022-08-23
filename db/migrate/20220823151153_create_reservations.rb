class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :toothbrush, null: false, foreign_key: true
      t.references :booker, null: false, foreign_key: { to_table: :users }
      t.datetime :start_date
      t.datetime :end_date
      t.float :total_price

      t.timestamps
    end
  end
end
