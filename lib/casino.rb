require_relative 'player'
require_relative 'high_low'

class Casino
  attr_accessor :player, :game

  def initialize
    @player = nil
    @game = nil
  end

  def new_player(name, bankroll)
    @player = Player.new(name, bankroll)
  end

  def play_game(game)
    case game
      when 'high_low'
        @game = HighLow.new(@player)
    end
  end
end