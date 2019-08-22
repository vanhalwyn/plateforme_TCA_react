class AppointmentsController < ApplicationController
  skip_after_action :verify_authorized, only: :index
  skip_after_action :verify_policy_scoped, only: :index

  def index
    # Display free time_slots
    date = params[:date].to_date
    p date
    appointments = Appointment.where(date: date).map{|appointment| appointment.timeslot}
    p appointments
    # render the list of appointments
    render json: { :appointments => appointments}
  end
end
