class Wallet
  attr_accessor :total
  def initialize(total)
    @total = total
    puts "You have $#{@total} in your wallet!"
    # if @player.wallet.total >= 0
    #   puts "No more money! Come back later."
    #   exit (0)
    # end
  end
end