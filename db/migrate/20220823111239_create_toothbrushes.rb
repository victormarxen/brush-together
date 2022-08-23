class CreateToothbrushes < ActiveRecord::Migration[7.0]
  def change
    create_table :toothbrushes do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :color
      t.string :type
      t.float :daily_price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
