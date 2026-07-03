class AppointmentMailer < ApplicationMailer
  default from: ENV['GMAIL_USERNAME']

  def booking(appointment)
    @appointment = appointment

    mail(to: ENV['GMAIL_USERNAME'], subject: "New Appointment Booked")

  end




end
