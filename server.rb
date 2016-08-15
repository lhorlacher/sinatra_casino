require 'sinatra'
require 'pry'

# root route
get '/' do
	# form to create a new player
	#@player - show a game menu
	# that game menu is linked to each route
	# game route eg. /high_low, /craps
	erb :index
end

# GET the search form
get '/search' do	
end

# POST search form
post '/search'