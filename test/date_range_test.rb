require_relative 'test_helper'

describe "Date_range class" do
  describe "Date_range instantiation" do
    let(:date_range) { DateRange.new(check_in: Date.new(2019, 9, 10), check_out: Date.new(2019, 9, 15)) }
    
    # confirm Date_range exists
    it "is an instance of Date_range" do
      expect(date_range).must_be_kind_of DateRange
    end
    # raise exception for invalid date range
    describe "exception error method for invalid date range" do 
      let(:date_range1) { DateRange.new(check_in: Date.new(2019, 9, 10), check_out: Date.new(2019, 9, 8)) }
      let(:date_range2) { DateRange.new(check_in: Date.new(2019, 9, 4), check_out: Date.new(2019, 9, 4)) }
      
      it "raises an exception error when invalid date range is provided" do
        expect{DateRange.new(date_range1)}.must_raise Exception
        expect{DateRange.new(date_range2)}.must_raise Exception
      end
    end
  end
end
