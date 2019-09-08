require_relative 'test_helper'
require 'date'

describe "Hotel class" do
  describe "Hotel instantiation" do
    let(:hotel) { Hotel.new(reservation_list: []) }
    
    # confirm that Hotel class exists
    it "is an instance of Hotel" do
      expect(hotel).must_be_kind_of Hotel
    end 
  end
  
  # create hotel with 1 reservation test
  describe "is room available method" do 
    let(:date_range) { DateRange.new(check_in: Date.new(2019, 9, 10), check_out: Date.new(2019, 9, 15)) }
    let(:reservation) { Reservation.new(date_range: date_range, room_number: 1) }
    let(:hotel) { Hotel.new(reservation_list:[reservation]) }
    
    it "is room available to book when there are no bookings" do 
      expect(hotel.is_room_available(date_range: date_range, room_number: 2)).must_equal true
    end
    
    # Edge Cases: prevent overlap, before, during, after test reservation
    it "is room available to book when there are previously held bookings" do 
      expect(hotel.is_room_available(date_range: date_range, room_number: 1)).must_equal false 
    end
    
    it "test date range before room is booked " do 
      expect(hotel.is_room_available(date_range: DateRange.new(check_in: Date.new(2019, 9, 7), check_out: Date.new(2019, 9, 10)),room_number: 1 )).must_equal true 
    end
    
    it "test date range during the room booking " do 
      expect(hotel.is_room_available(date_range: DateRange.new(check_in: Date.new(2019, 9, 11), check_out: Date.new(2019, 9, 14)),room_number: 1 )).must_equal false 
    end
    
    it "test date range after the room checks out " do 
      expect(hotel.is_room_available(date_range: DateRange.new(check_in: Date.new(2019, 9, 15), check_out: Date.new(2019, 9, 16)), room_number: 1 )).must_equal true 
    end
  end
  
  # create 'make_reservation' method
  describe "make_reservation method" do 
    let(:date_range) { DateRange.new(check_in: Date.new(2019, 9, 10), check_out: Date.new(2019, 9, 15)) }
    let(:hotel) { Hotel.new(reservation_list:[]) }
    
    # check if reservation exists
    it "can a reservation be made for a given date range" do
      hotel.make_reservation(date_range: date_range)
      expect(hotel.reservation_list.first).must_be_kind_of Reservation
    end
    
    # Wave 2.3 Exception for overlapping reservation. Loop through all 20 rooms to simulate fully booked hotel, raise exception
    it "raises an exception when a reservation is being made that overlaps with current reservation dates for all rooms" do 
      20.times do
        hotel.make_reservation(date_range: date_range)
      end  
      expect(hotel.make_reservation(date_range: date_range)).must_raise ArgumentError
    end
  end
  
  # create method for 'track_reservation' using 3 sample given date ranges
  describe "track_reservation for given date method" do
    let(:reservation1) { Reservation.new(date_range: DateRange.new(check_in: Date.new(2019, 9, 8), check_out: Date.new(2019, 9, 11)), room_number: nil) }
    
    let(:reservation2) { Reservation.new(date_range: DateRange.new(check_in: Date.new(2019, 9, 5), check_out: Date.new(2019, 9, 10)), room_number: nil) }
    
    let(:reservation3) { Reservation.new(date_range: DateRange.new(check_in: Date.new(2019, 9, 12), check_out: Date.new(2019, 9, 16)), room_number: nil) }
    
    let(:hotel) { Hotel.new(reservation_list: [reservation1, reservation2, reservation3])}
    
    it "can track reservations by given date through a list of reservations" do 
      expect(hotel.track_reservation(date: Date.new(2019, 9,10))).must_be_kind_of Array
      expect(hotel.track_reservation(date: Date.new(2019, 9,10)).length).must_equal 2
    end
  end
  
  describe "available rooms method" do 
    let(:reservation1) { Reservation.new(date_range: DateRange.new(check_in: Date.new(2019, 9, 9), check_out: Date.new(2019, 9, 11)), room_number: 1) }
    
    let(:reservation2) { Reservation.new(date_range: DateRange.new(check_in: Date.new(2019, 9, 9), check_out: Date.new(2019, 9, 11)), room_number: 2) }
    
    let(:reservation3) { Reservation.new(date_range: DateRange.new(check_in: Date.new(2019, 9, 10), check_out: Date.new(2019, 9, 15)), room_number: 3) }
    
    let(:hotel) { Hotel.new(reservation_list: [reservation1, reservation2, reservation3])}
    
    it "can see available rooms for a given date range that are not reserved" do 
      expect(hotel.available_rooms(date_range: DateRange.new(check_in: Date.new(2019, 9, 9), check_out: Date.new(2019, 9, 11)))).must_be_kind_of Array
      expect(hotel.available_rooms(date_range: DateRange.new(check_in: Date.new(2019, 9, 8), check_out: Date.new(2019, 9, 10))).length).must_equal 18
    end
  end
end

