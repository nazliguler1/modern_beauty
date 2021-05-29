require 'rails_helper'

RSpec.describe Reservation, type: :model do
    
  it "is valid with valid attributes" do
		reservation = Reservation.new(name: "BU: Be You",
                                  date: "2021-05-01 02:55:05")
		expect(reservation).to be_valid
	end
  
	it "is invalid if no name is provided" do
		reservation = Reservation.new(name: nil)
		!expect(reservation).to be_valid
	end
  
  it "is invalid if no date provided" do
		reservation = Reservation.new(date: nil)
		!expect(reservation).to be_valid
	end
end
