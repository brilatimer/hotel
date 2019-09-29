class DateRange
  attr_reader :check_in, :check_out
  
  def initialize(check_in:, check_out:)
    @check_in = check_in
    @check_out = check_out
    
    if check_out < check_in || check_in == check_out
      raise Exception.new("Invalid date range provided; reservation cannot be made")
    end
  end
  
  def nights_booked
    return @check_out - @check_in 
  end
end


