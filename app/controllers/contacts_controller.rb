class ContactsController < ApplicationController
  def index
    @contact = Contact.new
    @imessage = imessage
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

  def ios?
    browser.platform.ios?
  end

  def mac?
    browser.platform.mac?
  end

  def imessage?
    browser.platform.ios? or browser.platform.mac?
  end

  def imessage
    if imessage?
      if ios?
        command = 'sms'
      elsif mac?
        command = 'imessage'
      end
    end
  end

end
