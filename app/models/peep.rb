class Peep

	attr_accessor :user

	include DataMapper::Resource

	property :id, Serial
	property :message, Text
	property :time_added, Time

	belongs_to :user
end