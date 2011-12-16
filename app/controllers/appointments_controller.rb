class AppointmentsController < ApplicationController
  before_filter :login_required

  def index
    @appointments = Appointment.not_archived
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
    @users_in_calendar = User.in_calendar
  end
  
  def archive
    @appointment = Appointment.find(params[:id])
    @appointment.archived = true
    if @appointment.save
      respond_to do |format|
        format.html {redirect_to appointments_url, :notice => t(:successfully_archived_appointment)}
        format.js
      end
    else
      respond_to do |format|
        format.html {render :action => 'index'}
        format.js
      end
    end
  end
  
  def archived
    @appointments = Appointment.archived
  end

  def create
    @appointment = Appointment.new(params[:appointment])
    if @appointment.save
      respond_to do |format|
        format.html {redirect_to appointments_url, :notice => t(:successfully_created_appointment)}
        format.js
      end
    else
      respond_to do |format|
        format.html {render :action => 'new'}
        format.js
      end
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @appointment.due = I18n.l @appointment.due
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

    respond_to do |format|
      format.html {redirect_to appointments_url, :notice => t(:successfully_destroyed_appointment)}
      format.js
    end
  end
end
