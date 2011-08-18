class AbsencesController < ApplicationController
  before_filter :login_required

  def index
    redirect_to availabilities_path
  end
end
