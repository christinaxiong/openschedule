class Event < ApplicationRecord
  belongs_to :user, :class_name => "User", :foreign_key=>"creator_id"

  validates :start_time, :presence => true
  validates :end_time, :presence => true

  validates :start_time, :presence => true, :uniqueness => { :scope => :name,
   :message => "Event has already been created!" }
  validates :end_time, :presence => true, :uniqueness => { :scope => :name,
   :message => "Event has already been created!" }

  validates :name, :presence => true

  validate :check_datetimes

  def check_datetimes
    if start_time.present? && end_time.present? && start_time > end_time
     errors.add(:base, "Start Time has to be earlier than End Time!" )
    end
  end

end
