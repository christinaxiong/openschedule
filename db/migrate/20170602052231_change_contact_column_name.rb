class ChangeContactColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :contacts, :user_id, :parent_id
  end
end
