class AvailabilitiesController < ApplicationController
  before_filter :login_required

  def index
    @holidays = Holiday.all
    @absences = Absence.all
  end
end
