require_relative 'player'
require_relative 'high_low'
require_relative 'craps'

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
      when 'craps'
        @game = Craps.new(@player)
    end
  end
end