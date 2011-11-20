module AvailabilitiesHelper
  def date_range(start_date, end_date)
    (end_date - start_date).to_i
  end
end
