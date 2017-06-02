class AddDefaultValueToIsprivate < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :isprivate, :boolean, :default => true
  end
end
