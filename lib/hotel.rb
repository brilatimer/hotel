require 'pry'
class Hotel
  
  attr_reader :reservation_list, :rooms
  RATE = 200
  
  def initialize(reservation_list)
    @reservation_list = reservation_list
    @rooms = (1..20).to_a
  end
  
  # "I can make a reservation of a room for a given date range"
  def make_reservation(date_range:)
    # Wave 2:
    # Loop through all @rooms  
    # Check if a room number is_room_available
    # Break out of loop if a room is available
    # If no rooms found in the loop, return 
    
    # Loop through rooms until one is available
    new_reservation = Reservation.new(date_range, room_number)
    @reservation_list << new_reservation # update list_reservations
  end
  
  # based on date range and room number, checks if room is available and returns true
  def is_room_available(date_range, room_number)
    room_match = @reservation_list.select {| reservation| reservation.room_number == room_number && reservation.date_range.check_out  > date_range.check_in && reservation.date_range.check_in <= date_range.check_out} 
    if room_match.length > 0
      return false
    else 
      return true
    end
  end
  
  def track_reservation(date)
    # room match return for dates
    
    # I can access the list of reservations for a specific date, so that I can track reservations by date
    # Use .select to find reservations for a specific date
    return # list of reservations for given date
  end
  
  
  
end