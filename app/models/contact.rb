class Contact < ApplicationRecord
  belongs_to :user, :class_name => "User", :foreign_key => "child_id"

end
