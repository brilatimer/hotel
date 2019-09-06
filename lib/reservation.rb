class Reservation
  
  attr_reader :date_range, :room_number, :confirmation_id, :cost
  RATE = 200
  def initialize(date_range:, room_number:, confirmation_id:, cost:)
    @date_range = date_range
    @room_number = room_number
    @confirmation_id = confirmation_id
    @cost = cost
  end
  
  def total_cost
    total_cost = (@date_range.check_out - @date_range.check_in) * (200)
    return total_cost.to_i
  end


end