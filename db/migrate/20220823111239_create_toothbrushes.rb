class CreateToothbrushes < ActiveRecord::Migration[7.0]
  def change
    create_table :toothbrushes do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :color
      t.string :type
      t.float :daily_price
      t.references :announcer, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
