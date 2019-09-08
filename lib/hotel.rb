require 'pry'
require_relative 'reservation'
class Hotel
  attr_reader :reservation_list, :rooms
  RATE = 200
  
  def initialize(reservation_list:)
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
    new_reservation = Reservation.new(date_range: date_range, room_number: nil, confirmation_id: nil, cost: nil)
    @reservation_list << new_reservation 
  end
  
  # based on date range and room number, checks if room is available and returns true
  def is_room_available(date_range: date_range, room_number: room_number)
    room_match = @reservation_list.select {| reservation|reservation.room_number == room_number && reservation.date_range.check_out  > date_range.check_in && reservation.date_range.check_in <= date_range.check_out} 
    if room_match.length > 0
      return false
    else 
      return true
    end
  end

  # Wave 2.1 create method to view a list of rooms that are not reserved for a given date range, so that I can see all available rooms for that day
  def available_rooms(date_range:)
    available_rooms_list = []
    @rooms.each do |room_number| # loops through all 20 rooms to check availability
      if is_room_available(date_range: date_range, room_number: room_number) == true
        available_rooms_list << room_number # puts available rooms into available_rooms_list
      end
    end
    return available_rooms_list
  end
  
  # I can access the list of reservations for a specific date, so that I can track reservations by date
  def track_reservation(date:)
    track_reservation_by_date = @reservation_list.select {| reservation |date >= reservation.date_range.check_in && date <= reservation.date_range.check_out}
    return track_reservation_by_date  # reservations array for a given date
  end
end



