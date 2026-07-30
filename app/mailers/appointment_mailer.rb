class AppointmentMailer < ApplicationMailer
  default from: ENV['EMAIL_USERNAME']

  def booking(appointment)
    @appointment = appointment

    mail(to: ENV['EMAIL_USERNAME'], subject: "Please action ASAP >>> A new Contact Us form submission from the website")

  end




end
