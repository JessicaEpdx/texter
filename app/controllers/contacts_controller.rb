class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    @contact = Contact.new
  end

  def new
    @contact = Contact.new
    respond_to do |format|
      format.html {render :index }
      format.js
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice]="You added " + @contact.name + " to your Address Book!"
      respond_to do |format|
        format.html {render 'index'}
        format.js
      end
    else
      flash[:notice] = "Oops! Please fill in name and phone number, do not include dashes."
      respond_to do |format|
        format.html {render 'index'}
        format.js {render 'error'}
      end
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :phone)
  end
end
