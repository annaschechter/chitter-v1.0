require 'sinatra'
require 'data_mapper'
require 'rack-flash'

require_relative 'data_mapper_setup'
require_relative 'helpers/application'


use Rack::Flash, :sweep =>true

enable :sessions
set :session_secret, 'super secret'

get '/' do
	@peeps = Peep.all:order => [:time_added.asc]
	erb :index
end

get '/users/new' do
	erb :sign_up_page
end

post '/users/new' do
	@user = User.create(:name => params[:name],
						:user_name => params[:user_name],
		                :email => params[:email],
		                :password => params[:password])
	if @user.save
		session[:user_id] = @user.id
		redirect '/'	
    else
		flash[:errors] = ["This username or email is already taken"]
	end 
	
end

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











