class HolidaysController < ApplicationController
  before_filter :login_required
    
  def index
    redirect_to availabilities_path
  end
  
  def new
    @users_in_calendar = User.in_calendar
    @holiday = Holiday.new
  end
  
  def show
    @holiday = Holiday.find(params[:id])
  end
  
  def create
    @holiday = Holiday.new(params[:holiday])
    if @holiday.save
      redirect_to availabilities_url, :notice => t(:successfully_created_holiday)
    else
      render :action => 'new'
    end
  end

  def edit
    @holiday = Holiday.find(params[:id])
    @holiday.start_date = I18n.l @holiday.start_date
    @holiday.end_date = I18n.l @holiday.end_date
  end

  def update
    @holiday = Holiday.find(params[:id])
    if @holiday.update_attributes(params[:holiday])
      redirect_to availabilities_url, :notice  => t(:successfully_updated_holiday)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @holiday = Holiday.find(params[:id])
    @holiday.destroy
    redirect_to availabilities_url, :notice => t(:successfully_destroyed_holiday)
  end
  
end
