require 'simplecov'
SimpleCov.start

require_relative 'test_helper'
require 'date'

describe "Hotel class" do
  
  # hotel class exists
  describe "Hotel instantiation" do
    let(:hotel) { Hotel.new(reservation_list: []) }
    
    it "is an instance of Hotel" do
      expect(hotel).must_be_kind_of Hotel
    end
    
  end
  
  # created hotel with 1 reservation
  # make lets here 
  describe "is room available method" do 
    let(:date_range) { DateRange.new(check_in: Date.new(2019, 9, 10), check_out: Date.new(2019, 9, 15)) }
    let(:reservation) { Reservation.new(date_range: date_range, room_number: 1, confirmation_id: nil, total_cost: nil) }
    let(:hotel) { Hotel.new(reservation_list:[reservation]) }
    
    
    it "is room available to book when there are no bookings" do 
      expect(hotel.is_room_available(date_range: date_range, room_number: 2)).must_equal true
    end
    
    it "is room available to book when there are previously held bookings" do 
      expect(hotel.is_room_available(date_range: date_range, room_number: 1)).must_equal false # make everything else like this in the parens
    end
  end
  
end

# "test for make_reservation"
# "test for is_room_available"




# "test for track_reservation"
# if "track_resrvatinon" do 
#   expect(@hotel.track_reservation(DateTime.new(2019,9,10))) [An array of reservations]
# end
# pass in date time object to track reservations