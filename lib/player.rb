$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'wallet'
require 'pry'

class Player
  attr_accessor :name, :wallet
  def initialize(name, wallet)
    @name = name
    @wallet = Wallet.new(wallet)
  #setup instance varieable
  #by getting user input
  # like name, age, wallet amount
  end
end