class Player
  attr_accessor :name, :wallet
  def initialize(name, wallet)
    @name = name
    @wallet = Wallet.new(wallet)
    puts "Created a new Player #{@name}"
  #setup instance varieable
  #by getting user input
  # like name, age, wallet amount
  end
end