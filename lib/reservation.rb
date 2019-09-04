class Reservation
end

attr_reader :date_range, :confirmation, :total_cost, :RATE

def initalize()
  @date_range = date_range
  @confirmation = confirmation
  @total_cost = total_cost
  @RATE = $200
end