class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.date :appointment_date
      t.time :appointment_time
      t.string :treatment_enquiry
      t.text :message
      t.boolean :covid_confirmation

      t.timestamps
    end
  end
end
