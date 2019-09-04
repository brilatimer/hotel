class Reservation
  
  attr_reader :date_range, :room_number, :confirmation_id, :total_cost, :RATE
  
  def initialize(date_range:, room_number:, confirmation_id:, total_cost:)
    @date_range = date_range
    @room_number = room_number
    @confirmation_id = confirmation_id
    @total_cost = total_cost
    @RATE = $200 # dollar sign is nil
  end
  
  def total_cost()
    return 
  end
end