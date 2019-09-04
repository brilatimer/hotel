class Hotel
  
  attr_reader :list_reservations, :RATE, :available_rooms
  
  def initialize()
    @list_reservations = list_reservations
    @RATE = $200
    @available_rooms = []
  end
end
