class Reservation
  
  attr_reader :date_range, :room_number
  RATE = 200
  def initialize(date_range:, room_number:)
    @date_range = date_range
    @room_number = room_number
  end
  
  def total_cost
    total_cost = (@date_range.check_out - @date_range.check_in) * (RATE)
    return total_cost.to_i
  end
end