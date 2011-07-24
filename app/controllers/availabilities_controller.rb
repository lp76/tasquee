class AvailabilitiesController < ApplicationController
  
  def index
    @holidays = Holiday.all
    @absences = Absence.all
  end
end
