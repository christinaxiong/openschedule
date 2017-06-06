class AvailableContactsController < ApplicationController

  def search
    @start_time=params[:start_time]
    @end_time = params[:end_time]
    render("available_contacts/search.html.erb")
  end

  def show
    @start_time=params[:start_time]
    @end_time = params[:end_time]
    @available_contacts_list = []
    current_user.contacts.each do |contact|
      is_available = true
      contact.user.events.each do |event|
        if event.start_time > params[:end_time]
          #do nothing
        elsif event.end_time < params[:start_time]
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
