class CalendarEntriesController < ApplicationController
  def index
    @calendar_entries = CalendarEntry.all

    render("calendar_entries/index.html.erb")
  end

  def show
    @calendar_entry = CalendarEntry.find(params[:id])

    render("calendar_entries/show.html.erb")
  end

  def new
    @calendar_entry = CalendarEntry.new

    render("calendar_entries/new.html.erb")
  end

  def create
    @calendar_entry = CalendarEntry.new

    @calendar_entry.user_id = params[:user_id]
    @calendar_entry.event_id = params[:event_id]
    @calendar_entry.start_time = params[:start_time]
    @calendar_entry.end_time = params[:end_time]

    save_status = @calendar_entry.save

    if save_status == true
      redirect_to("/calendar_entries/#{@calendar_entry.id}", :notice => "Calendar entry created successfully.")
    else
      render("calendar_entries/new.html.erb")
    end
  end

  def edit
    @calendar_entry = CalendarEntry.find(params[:id])

    render("calendar_entries/edit.html.erb")
  end

  def update
    @calendar_entry = CalendarEntry.find(params[:id])

    @calendar_entry.user_id = params[:user_id]
    @calendar_entry.event_id = params[:event_id]
    @calendar_entry.start_time = params[:start_time]
    @calendar_entry.end_time = params[:end_time]

    save_status = @calendar_entry.save

    if save_status == true
      redirect_to("/calendar_entries/#{@calendar_entry.id}", :notice => "Calendar entry updated successfully.")
    else
      render("calendar_entries/edit.html.erb")
    end
  end

  def destroy
    @calendar_entry = CalendarEntry.find(params[:id])

    @calendar_entry.destroy

    if URI(request.referer).path == "/calendar_entries/#{@calendar_entry.id}"
      redirect_to("/", :notice => "Calendar entry deleted.")
    else
      redirect_to(:back, :notice => "Calendar entry deleted.")
    end
  end
end
