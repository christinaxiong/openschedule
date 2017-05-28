Rails.application.routes.draw do
  # Routes for the Calendar_entry resource:
  # CREATE
  get "/calendar_entries/new", :controller => "calendar_entries", :action => "new"
  post "/create_calendar_entry", :controller => "calendar_entries", :action => "create"

  # READ
  get "/calendar_entries", :controller => "calendar_entries", :action => "index"
  get "/calendar_entries/:id", :controller => "calendar_entries", :action => "show"

  # UPDATE
  get "/calendar_entries/:id/edit", :controller => "calendar_entries", :action => "edit"
  post "/update_calendar_entry/:id", :controller => "calendar_entries", :action => "update"

  # DELETE
  get "/delete_calendar_entry/:id", :controller => "calendar_entries", :action => "destroy"
  #------------------------------

  # Routes for the Contact resource:
  # CREATE
  get "/contacts/new", :controller => "contacts", :action => "new"
  post "/create_contact", :controller => "contacts", :action => "create"

  # READ
  get "/contacts", :controller => "contacts", :action => "index"
  get "/contacts/:id", :controller => "contacts", :action => "show"

  # UPDATE
  get "/contacts/:id/edit", :controller => "contacts", :action => "edit"
  post "/update_contact/:id", :controller => "contacts", :action => "update"

  # DELETE
  get "/delete_contact/:id", :controller => "contacts", :action => "destroy"
  #------------------------------

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "calendar#index"
end
