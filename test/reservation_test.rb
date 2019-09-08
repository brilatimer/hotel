require_relative 'test_helper'


# create test for 'total_cost' method
describe "total cost method" do 
  let(:reservation1) { Reservation.new(date_range: DateRange.new(check_in: Date.new(2019, 9, 8), check_out: Date.new(2019, 9, 11)), room_number: nil) }  
  let(:reservation2) { Reservation.new(date_range: DateRange.new(check_in: Date.new(2019, 9, 5), check_out: Date.new(2019, 9, 10)), room_number: nil) }
  let(:reservation) { Reservation.new.total_cost(reservation_list: [reservation1, reservation2])}
  
  it "gives the total cost for a given reservation" do 
    expect(reservation1.total_cost).must_be_kind_of Integer
    expect(reservation1.total_cost).must_equal 600
  end
end