class AddChildIdToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :child_id, :integer
  end
end
