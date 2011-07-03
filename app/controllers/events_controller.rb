class EventsController < ApplicationController
  before_filter :login_required

  def index
    @date = params[:week] ? Date.parse(params[:week]) : Date.today
    @week = Range.new(@date.beginning_of_week, @date.end_of_week)
    @users = User.in_calendar
    @appointment = Appointment.new
  end
end
