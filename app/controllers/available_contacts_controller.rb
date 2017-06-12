class AvailableContactsController < ApplicationController

  def search
    date_format = "%m/%d/%Y %H:%M %p"
    @start_time=DateTime.strptime(params[:start_time], date_format).to_s
    @end_time = DateTime.strptime(params[:end_time], date_format).to_s
    render("available_contacts/search.html.erb")
  end

  def show
    date_format = "%m/%d/%Y %H:%M %p"
    @start_time=DateTime.strptime(params[:start_time], date_format).to_s
    @end_time = DateTime.strptime(params[:end_time], date_format).to_s
    @available_contacts_list = []
    current_user.contacts.each do |contact|
      is_available = true
      contact.user.events.each do |event|
        if event.start_time > @end_time
          #do nothing
        elsif event.end_time < @start_time
          #do nothing
        else is_available= false
        end
      end
      if is_available
        @available_contacts_list.push(contact)
      end
    end
    render("available_contacts/show.html.erb")
  end
end
