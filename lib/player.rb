$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'pry'

class Player
  attr_accessor :name, :bankroll
  def initialize(name, bankroll)
    @name = name
    @bankroll = bankroll.to_f
  #setup instance varieable
  #by getting user input
  # like name, age, wallet amount
  end
end