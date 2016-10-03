class ContactMailer < ApplicationMailer

  def feedback(contact)
    @contact = contact
    mail(to: "me@golovkin.cc", subject: "golovkin.cc: Привет от #{@contact}")
  end
end
