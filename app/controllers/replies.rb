
get '/replies/new/:peep_id' do
	@peep = Peep.first(:id => params[:peep_id])
	session[:peep_id] = @peep.id
	@user = User.first(:id => session[:user_id])

	if @user
		erb :"replies/new"	
	else 
		flash[:errors] = ["You need to sign in to reply on Chitter"]
	end
end


post '/replies' do
	@reply = Reply.create(:message => params[:message],
				       :time_added => Time.now,
				       :user_id => session[:user_id],
				       :peep_id => session[:peep_id])
	if @reply.save
		redirect '/'
	else 
		flash[:errors] = ["Your reply cannot be empty"]
	end
end

get '/replies/:peep_id' do
	@peep = Peep.first(:id => params[:peep_id])
	@replies = Reply.all(:peep_id => params[:peep_id])
	@user = User.first(:id => @peep.user_id)
	erb :"replies/show"
end