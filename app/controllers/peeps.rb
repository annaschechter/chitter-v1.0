get '/peeps/new' do
	@peeps = Peep.all
	user = User.first(:id => session[:user_id])
	if user
		erb :"peeps/new"	
	else 
		flash[:errors] = ["You need to sign in to post on Chitter"]
	end
end

post '/peeps' do
	@peeps = Peep.all
	user = User.first(:id => session[:user_id])
		if user
			peep = Peep.create(:message => params[:message],
					       :time_added => Time.now,
					       :user_id => user.id)
			redirect '/'
	    else
			redirect '/peeps/new'
		end
end