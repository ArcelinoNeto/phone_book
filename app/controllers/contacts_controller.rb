class ContactsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_contact, only: [:edit, :update, :show, :destroy]
    before_action :owner_contact, only: [:edit, :update, :show, :destroy]

  def index
    @contacts = current_user.contacts
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.new(params_contact)
    if @contact.save
      redirect_to contacts_path, notice: "O contato (#{@contact.name} #{@contact.last_name}) foi salvo com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contact.update(params_contact)
      redirect_to contacts_path, notice: "O contato (#{@contact.name} #{@contact.last_name}) foi alterado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @contact.destroy
      redirect_to contacts_path, notice: "O contato (#{@contact.name} #{@contact.last_name}) foi apagado com sucesso!"
    else
      render :destroy
    end
  end

  private

    def params_contact
      params.require(:contact).permit(:name, :last_name, :number, :user_id)
    end

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def owner_contact
      unless current_user == @contact.user
        redirect_to contacts_path
      end
    end
end
