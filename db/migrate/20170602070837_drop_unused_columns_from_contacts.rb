class DropUnusedColumnsFromContacts < ActiveRecord::Migration[5.0]
  def change
    remove_column :contacts, :name
    remove_column :contacts, :email
    remove_column :contacts, :photo
  end
end
