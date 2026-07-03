class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      AppointmentMailer.booking(@appointment).deliver_now
      redirect_to root_path, notice: "Appointment request sent successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(
      :name,
      :email,
      :phone,
      :appointment_at,
      :treatment_enquiry,
      :message,
      :covid_confirmation
    )
  end
end
