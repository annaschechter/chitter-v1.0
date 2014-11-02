post '/replies/new' do
	@peeps = Peep.all

	peep = Peep.first(:id => params[:id])
	user = User.first(:id => session[:user_id])
	if user
		erb :"replies/new"	
	else 
		flash[:errors] = ["You need to sign in to reply on Chitter"]
	end
end



post '/replies' do
	user = User.first(:id => session[:user_id])

		reply = Peep.create(:message => params[:message],
				       :time_added => Time.now,
				       :user_id => user.id,
				       :peep_id => peep.id)
		redirect '/'
end