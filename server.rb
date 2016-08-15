$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'sinatra'
require 'pry'
require 'lib/player.rb'

# root route
get '/' do
  @player = Player.new('garrett', 100) 
	# form to create a new player
	#@player - show a game menu
	# that game menu is linked to each route
	# game route eg. /high_low, /craps
	erb :index
end

# GET the search form
# get '/search' do	
# end

# POST search form
# post '/search'

get '/craps' do
  erb :craps
end

get '/slots' do
  erb :slots
end
