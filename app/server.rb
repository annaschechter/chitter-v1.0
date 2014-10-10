require 'sinatra'
require 'data_mapper'
require 'rack-flash'

require_relative 'data_mapper_setup'


use Rack::Flash, :sweep =>true

enable :sessions
set :session_secret, 'super secret'


get '/users/new' do
	erb :index
end

post '/users/new' do
	@user = User.create(:name => params[:name],
						:user_name => params[:user_name],
		                :email => params[:email],
		                :password => params[:password])
	if @user.save
		"Hello {@user.name}"
    else
		flash[:errors] = ["This username or email is already taken"]
	end 
	
end