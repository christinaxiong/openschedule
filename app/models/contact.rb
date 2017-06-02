class Contact < ApplicationRecord
  belongs_to :user, :class_name => "User", :foreign_key => "child_id"

  validates :name, :presence => true, :uniqueness => { :scope => :email, :message => "has already been added!"}
  validates :email, :presence => true



end
