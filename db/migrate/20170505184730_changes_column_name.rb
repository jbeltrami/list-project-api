class ChangesColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :wishes, :wish, :goal
  end
end
