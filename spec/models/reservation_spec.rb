require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it "is valid with valid attributes" do
		reservation = Reservation.new(name: "BU: Be You",
                                  category: "Beauty Salon", 
                                  location: "123 Road St. Binghamton, NY", 
                                  rating: "4.0", 
                                  price: "$$",
                                  date: "2021-05-01 02:55:05",
                                  user: "Tester Suny")
		expect(reservation).to be_valid
	end
  
	it "is invalid if no name is provided" do
		reservation = Reservation.new(name: nil)
		!expect(reservation).to be_valid
	end
  
  it "is invalid if user does not exist" do
		reservation = Reservation.new(user: nil)
		!expect(reservation).to be_valid
	end
  
  it "is invalid if no date provided" do
		reservation = Reservation.new(date: nil)
		!expect(reservation).to be_valid
	end
end
