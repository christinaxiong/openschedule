class EventsController < ApplicationController
  def calendar
    @events = Event.where(:creator_id=>current_user.id)
    render("events/calendar.html.erb")
  end

  def index
    contact_user_ids = Contact.where(:parent_id => current_user.id).pluck(:child_id)
    @events = Event.where(:creator_id => current_user.id)
    contacts_events = Event.where(:creator_id => contact_user_ids, :isprivate => false)

    @events = @events + contacts_events

    render("events/index.html.erb")
  end

  def show
    @event = Event.find(params[:id])

    render("events/show.html.erb")
  end

  def new
    @event = Event.new
    render("events/new.html.erb")
  end

  def create
    @event = Event.new

    @event.name = params[:name]
    @event.creator_id = current_user.id
    date_format = "%m/%d/%Y %H:%M:%S"
    @event.start_time = DateTime.strptime(params[:start_time], date_format).to_s
    @event.end_time = params[:end_time]
    @event.location = params[:location]
    @event.location_address = params[:location_address]
    @event.isprivate = params.key?(:isprivate)

    save_status = @event.save
    if save_status == true
      redirect_to("/events/#{@event.id}", :notice => "Event created successfully.")
    else
      render("events/new.html.erb")
    end
  end

  def edit
    @event = Event.find(params[:id])

    if current_user.id != @event.creator_id
      redirect_to("/", :notice => "Not enough permissions.")
    else
      render("events/edit.html.erb")
    end
  end

  def update
    @event = Event.find(params[:id])

    if current_user.id != @event.creator_id
      redirect_to("/", :notice => "Not enough permissions.")
    else
      @event.name = params[:name]
      @event.creator_id = params[:creator_id]
      @event.start_time = params[:start_time]
      @event.end_time = params[:end_time]
      @event.location = params[:location]
      @event.location_address = params[:location_address]

      save_status = @event.save

      if save_status == true
        redirect_to("/events/#{@event.id}", :notice => "Event updated successfully.")
      else
        render("events/edit.html.erb")
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])

    if current_user.id != @event.creator_id
      redirect_to("/", :notice => "Not enough permissions.")
    else
      @event.destroy

      if URI(request.referer).path == "/events/#{@event.id}"
        redirect_to("/", :notice => "Event deleted.")
      else
        redirect_to(:back, :notice => "Event deleted.")
      end
    end
  end
end
