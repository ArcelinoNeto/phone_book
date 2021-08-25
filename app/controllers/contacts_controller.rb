class ContactsController < ApplicationController
    before_action :authenticate_user!

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.new(params_contact)
    if @contact.save
      redirect_to contacts_path, notice: "O contato #{@contact.name} #{@contact.last_name} foi salvo com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def params_contact
    params.require(:contact).permit(:name, :last_name, :number, :user_id)
  end
end
