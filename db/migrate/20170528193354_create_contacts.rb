class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :contact_name
      t.string :contact_email
      t.string :contact_photo
      t.integer :user_id

      t.timestamps

    end
  end
end
