class ChangeAppointmentDateTimeToAppointmentAt < ActiveRecord::Migration[8.0]
  def change
    remove_column :appointments, :appointment_date
    remove_column :appointments, :appointment_time
    add_column :appointments, :appointment_at, :datetime
  end
end
