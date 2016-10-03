class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        ContactMailer.feedback(@contact).deliver_now
      end
      format.js {}
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
