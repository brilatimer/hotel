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
  
  describe "make_reservation method" do 
    let(:date_range) { DateRange.new(check_in: Date.new(2019, 9, 10), check_out: Date.new(2019, 9, 15)) }
    let(:hotel) { Hotel.new(reservation_list:[]) }
    
    # check if reservation exists
    it "can a reservation be made for a given date range" do
      hotel.make_reservation(date_range: date_range)
      expect(hotel.reservation_list.first).must_be_kind_of Reservation
    end
  end
  
  describe "track_reservation for given date method" do
    let(:reservation1) { Reservation.new(date_range: DateRange.new(check_in: Date.new(2019, 9, 8), check_out: Date.new(2019, 9, 11)), room_number: nil, confirmation_id: nil, total_cost: nil) }
    
    let(:reservation2) { Reservation.new(date_range: DateRange.new(check_in: Date.new(2019, 9, 5), check_out: Date.new(2019, 9, 10)), room_number: nil , confirmation_id: nil, total_cost: nil) }
    
    let(:reservation3) { Reservation.new(date_range: DateRange.new(check_in: Date.new(2019, 9, 12), check_out: Date.new(2019, 9, 16)), room_number: nil, confirmation_id: nil, total_cost: nil) }
    
    let(:hotel) { Hotel.new(reservation_list: [reservation1, reservation2, reservation3])}
    
    it "can track reservations by given date through a list of reservations" do 
      expect(hotel.track_reservation(date: Date.new(2019, 9,10))).must_be_kind_of Array
      expect(hotel.track_reservation(date: Date.new(2019, 9,10)).length).must_equal 2
    end
  end
  # pass in date time object to track reservations
  
  
  # "test for is_room_available"
end

