class Reply

	attr_accessor :user
	attr_accessor :peep

	include DataMapper::Resource

	property :id, Serial
	property :message, Text
	property :time_added, Time

	belongs_to :user
	belongs_to :peep
end