class RemovePrivateFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :private, :boolean
  end
end
