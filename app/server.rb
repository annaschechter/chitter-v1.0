require 'sinatra'
require 'data_mapper'
require 'rack-flash'

require_relative 'data_mapper_setup'
require_relative 'helpers/application'


require_relative './controllers/users'
require_relative './controllers/peeps'
require_relative './controllers/sessions'
require_relative './controllers/replies'
require_relative './controllers/application'

use Rack::Flash, :sweep =>true


enable :sessions
set :session_secret, 'super secret'
set :public_folder, Proc.new{ File.join(root, '..', 'public')}

















