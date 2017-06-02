class ContactsController < ApplicationController
  def index
    @contacts = Contact.where({:parent_id=>current_user.id})

    render("contacts/index.html.erb")
  end

  def show
    @contact = Contact.find(params[:id])

    if current_user.id != @contact.creator_id
      redirect_to("/", :notice => "Not enough permissions.")
    else
      render("contacts/show.html.erb")
    end
  end

  def new
    @contact = Contact.new

    render("contacts/new.html.erb")
  end

  def create
    @contact = Contact.new

    @contact.name = params[:name]
    @contact.email = params[:email]
    @contact.photo = params[:photo]
    @contact.parent_id = current_user.id
    @contact.child_id = params[:child_id]

    save_status = @contact.save

    if save_status == true
      redirect_to("/contacts/#{@contact.id}", :notice => "Contact created successfully.")
    else
      render("contacts/new.html.erb")
    end
  end

  def edit
    @contact = Contact.find(params[:id])

    if current_user.id != @contact.creator_id
      redirect_to("/", :notice => "Not enough permissions.")
    else
      render("contacts/edit.html.erb")
    end
  end

  def update
    @contact = Contact.find(params[:id])

    if current_user.id != @contact.creator_id
      redirect_to("/", :notice => "Not enough permissions.")
    else
      @contact.name = params[:name]
      @contact.email = params[:email]
      @contact.photo = params[:photo]
      @contact.user_id = params[:user_id]

      save_status = @contact.save

      if save_status == true
        redirect_to("/contacts/#{@contact.id}", :notice => "Contact updated successfully.")
      else
        render("contacts/edit.html.erb")
      end
    end
  end

  def destroy
    @contact = Contact.find(params[:id])

    if current_user.id != @contact.creator_id
      redirect_to("/", :notice => "Not enough permissions.")
    else
      @contact.destroy

      if URI(request.referer).path == "/contacts/#{@contact.id}"
        redirect_to("/", :notice => "Contact deleted.")
      else
        redirect_to(:back, :notice => "Contact deleted.")
      end
    end
  end
end
