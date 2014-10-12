get '/' do
	@peeps = Peep.all:order => [:time_added.asc]
	erb :index
end