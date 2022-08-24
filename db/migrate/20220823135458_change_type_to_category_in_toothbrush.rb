class ChangeTypeToCategoryInToothbrush < ActiveRecord::Migration[7.0]
  def change
    rename_column :toothbrushes, :type, :category
  end
end
