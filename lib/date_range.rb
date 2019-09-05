class DateRange
  
  attr_reader :check_in, :check_out
  
  def initialize(check_in:, check_out:)
    @check_in = check_in
    @check_out = check_out
    
    # I want exception raised when an invalid date range is provided, so that I can't make a reservation for an invalid date range
  end
end



# open coverage/index.html to open pretty test