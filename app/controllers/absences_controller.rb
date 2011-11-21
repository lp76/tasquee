class AbsencesController < ApplicationController
  before_filter :login_required

  def index
    redirect_to availabilities_path
  end
  
  def new
    @absence = Absence.new
    @users_in_calendar = User.in_calendar
  end
  
  def show
    @absence = Absence.find(params[:id])
  end

  def create
    @absence = Absence.new(params[:absence])
    if @absence.save
      redirect_to availabilities_url, :notice => t(:successfully_created_absence)
    else
      render :action => 'new'
    end
  end

  def edit
    @absence = Absence.find(params[:id])
    @absence.day = I18n.l @absence.day
    @absence.start_time = I18n.l @absence.start_time, :format => :calendar
    @absence.end_time = I18n.l @absence.end_time, :format => :calendar
  end

  def update
    @absence = Absence.find(params[:id])
    if @absence.update_attributes(params[:absence])
      redirect_to availabilities_url, :notice  => t(:successfully_updated_absence)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @absence = Absence.find(params[:id])
    @absence.destroy
    redirect_to availabilities_url, :notice => t(:successfully_destroyed_absence)
  end
end
