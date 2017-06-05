class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :contacts, :foreign_key=> "parent_id", :dependent => :destroy
  has_many :events, :foreign_key => "creator_id", :dependent => :nullify

  validates :email, uniqueness: true
end
