get '/' do
	@peeps = Peep.all:order => [:time_added.desc]
	erb :index
end