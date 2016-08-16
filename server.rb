$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'sinatra'
require 'pry'
require 'lib/casino'
require_relative 'lib/slots'
require_relative 'lib/craps'

$casino = Casino.new

# root route
get '/' do
	erb :index
end

get '/atm' do
  erb :atm
end

get '/high_low' do
  $casino.play_game('high_low')
  erb :high_low
end

get '/slots' do
    @slots = [url('/images/pearl.jpeg'), url('/images/SandDollar.jpg'), url('/images/StarFish.jpg')]
  @slot_1 = @slots.sample
  @slot_2 = @slots.sample
  @slot_3 = @slots.sample
    @result = Slots.results(@slot_1, @slot_2, @slot_3)
    erb :slots
end

get '/craps' do
    @game = Craps.new(@player)
    Craps.start
    erb :craps
end

post '/create_player' do
  $casino.new_player(params[:player_name], params[:player_bankroll])
  redirect '/'
end

post '/add_bankroll' do
  $casino.player.bankroll += params[:amount].to_f
  redirect '/atm'
end

post '/high_low_bet' do
  @result = $casino.game.compare(params[:bet_amount], params[:choice])
  erb :high_low_result
end


post '/set_pass' do
    @pass = params[:pass]
    @pass_bet = params[:pass_bet].to_f
    Craps.pass_bet_check
    erb :craps
end

post '/set_odds' do
    @odds = params[:odds].to_sym
    @odds_bet = params[:odds_bet].to_f
    Craps.odds_bet_check
    erb :craps
end

post '/roll' do
    Craps.roll
end