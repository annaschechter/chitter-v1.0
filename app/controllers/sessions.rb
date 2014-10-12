
get '/sessions/new' do
	erb :sign_in_page
end

post '/sessions' do
	email, password = params[:email], params[:password]
	user = User.authenticate(email, password)
	if user
		session[:user_id] = user.id
        redirect to('/')
    else
    	flash[:errors] = ["The email or password is incorrect"]
    end
end

delete '/sessions' do
	session[:user_id] = nil
	redirect '/'
end
