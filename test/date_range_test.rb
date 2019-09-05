require 'simplecov'
SimpleCov.start

require_relative 'test_helper'

describe "Date_range class" do
  
  describe "Date_range instantiation" do
    before do
      @date_range = DateRange.new(check_in: nil, check_out: nil)
    end
    
    it "is an instance of Date_range" do
      expect(@date_range).must_be_kind_of DateRange
    end
    
  end
end