class Available_Contacts < ApplicationRecord
  def check_datetimes
    if start_time.present? && end_time.present? && start_time > end_time
     errors.add(:base, "Start Time has to be earlier than End Time!" )
    end
  end
end
