get '/peeps/new' do
	user = User.first(:id => session[:user_id])
	if user
		erb :post_peep	
	else 
		flash[:errors] = ["You need to sign in to post on Chitter"]
	end
end

post '/peeps' do
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