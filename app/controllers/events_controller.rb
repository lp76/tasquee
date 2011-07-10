class EventsController < ApplicationController
  before_filter :login_required

  def index
    @date = params[:week] ? Date.parse(params[:week]) : Date.today
    @week = Range.new(@date.beginning_of_week, @date.end_of_week)
    @users = User.in_calendar
    @appointment = Appointment.new
  end

  def settings
    @users = User.in_calendar
  end

  def sort
    @users = User.in_calendar
    @users.each do |user|
      user.position = params[:user].index(user.id.to_s) + 1
      user.save
    end
    render :nothing => true
  end
end
