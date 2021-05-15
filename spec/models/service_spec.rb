require 'rails_helper'

RSpec.describe Service, type: :model do
  it "is valid with valid attributes" do
		service = Service.new(name: "BU: Be You",
                          category: "Beauty Salon", 
                          location: "123 Road St. Binghamton, NY", 
                          rating: "4.0", 
                          price: "$$")
		expect(service).to be_valid
	end
  
	it "is invalid if no name is provided" do
		service = Service.new(name: nil)
		!expect(service).to be_valid
	end
	
end
