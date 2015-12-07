class Location < ActiveRecord::Base
	attr_accessible :city, :state, :zip, :address, :lat, :lng

	has_many :pins
end
