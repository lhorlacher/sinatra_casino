class HighLow
  attr_accessor :player, :computer_number

  def initialize(player)
    @player = player
    @computer_number = rand(100)
  end

  def compare(bet_amount, choice)
    win = false
    compare_number = rand(100)
    binding.pry
    # if choice == higher
      # check to see if compare number > @compuer_number
      # win = true
      # player.bankroll += bet_amount.to_f
    # elsif choice == lower
      # check to see if compare number < @computer_number
      # win = true
      # player.bankroll += bet_amount.
    # else
      # player.bankroll -= bet_amount
    win
  end

end