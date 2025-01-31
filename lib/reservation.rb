class Reservation
  
  attr_reader :date_range, :room_number
  RATE = 200 # this can be adjusted in the future
  def initialize(date_range:, room_number:)
    @date_range = date_range
    @room_number = room_number
  end
  
  def total_cost
    total_cost = (@date_range.nights_booked) * (RATE) # calculate number of nights, multiply by set constant RATE
    return total_cost.to_i
  end
end