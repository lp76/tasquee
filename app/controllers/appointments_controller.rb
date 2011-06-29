class AppointmentsController < ApplicationController
  before_filter :login_required

  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
    @users_in_calendar = User.in_calendar
  end

  def create
    @appointment = Appointment.new(params[:appointment])
    if @appointment.save
      redirect_to appointments_url, :notice => t(:successfully_created_appointment)
    else
      render :action => 'new'
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update_attributes(params[:appointment])
      redirect_to appointments_url, :notice  => t(:successfully_updated_appointment)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_url, :notice => "Successfully destroyed appointment."
  end
end
