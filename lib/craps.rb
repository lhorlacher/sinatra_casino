

class Craps
	attr_accessor :pass, :pass_bet, :game_point, :odds, :odds_bet, :roll, :message, :player
	
	def initialize(player)
		@player = player
		@pass = nil
		@pass_bet = nil
		@game_point = nil
		@odds = nil
		@odds_bet = nil
		@roll = nil
		@message = "Place your bet! Min is $10. Max is $#{'%.02f' % @player.bankroll}."
	end

	def instructions
		puts "\n\n********************************"
		puts "WELCOME TO CRAPS!"
		puts "********************************\n\n"
		puts "Choose 'Pass' or 'Dont' to choose your bet type."
		puts "Then enter your bet amount."
		puts "Type 'odds' any time after a a point has been"
		puts "established to place an Odds bet."
		puts "Type 'help' for detailed instructions.\n\n"
	end

	def help
		puts "Pass and Don't Pass Bets:"
		puts "Overall, the 'Pass' route has lower odds, but higher pay out."
		puts "Placing a 'Pass' bet means that you are betting with active player."
		puts "A 'Don't Pass' bet bets against the active player."
		puts "The active player is the player rolling the dice."
		puts "In this game, you are never the active player."
		puts "Press enter to continue."
		gets
		puts "For 'Pass' bets:"
		puts "A roll of 7 or 11 on the come out roll is a win (1:1)."
		puts "A 2, 3 or 12  on the come out result in an instant loss (0:1)."
		puts "A 4, 5, 6, 8, 9, 10  on the come out establish the 'Point'."
		puts "Once a point is established only the 'Point' and 7 matter."
		puts "Re-rolling the Point results in a win (1:1)."
		puts "Rolling a 7 results in a loss (0:1)."
		puts "Press 'enter' to continue."
		gets
		puts "For a 'Don't Pass' bet:"
		puts "A roll of 2 or 3 on the come out roll is a win (1:1)."
		puts "A 7 or 11 on the come out result in an instant loss (0:1)."
		puts "A 12 on the come out results in a tie, with no win or loss."
		puts "A 4, 5, 6, 8, 9, 10 on the come out establish the 'Point'."
		puts "Once a point is established only the 'Point' and 7 matter."
		puts "Re-rolling the Point results in a loss (1:0)."
		puts "Rolling a 7 results in a win (0:1)."
		puts "Press 'enter' to continue."
		gets
		puts "Odds bets:"
		puts "Once a point has been established, you can choose to place"
		puts "an 'Odds' bet."
		puts "This increases the amount of money you are betting that"
		puts "the point or the 7 will come up first (for 'Pass' and 'Don't Pass'"
		puts "bets respectively)."
		puts "The odds for 'Odds' bets vary depending on the point."
		puts "For Pass bets, 4 and 10 have 2:1 odds, 5 and 9 have 3:2 odds"
		puts "and 6 and 8 have 5:6 odds."
		puts "For 'Don't Pass' bets, 4 and 10 have 1:2 odds, 5 and 9 have 2:3"
		puts "and 6 and 8 have 6:5 odds."

		# puts "Press 'enter' to continue."
		# gets
		# puts "Come bets:"
		# puts "Once the 'Pass' or 'Don't Pass' bet have been placed,"
		# puts "and the come out roll has been thrown a player can"
		# puts "place a 'Come' bet."
		# puts "The 'Come' bet is not affected by whether you choose to"
		# puts "place a 'Pass' or 'Don't Pass' bet."
		# puts "Press 'enter' to continue."
		# gets
		# puts "Come bets (cont'd):"
		# puts "A 'Come' bet is a personal 'Pass' bet."
		# puts "All the same rules apply after the point is established."
		# puts "Once the come out roll has been thrown, and a point"
		# puts "has been established, you can place a 'Come' bet at any time."
		# puts "Press 'enter' to continue."
		# gets
		# puts "Come bets (cont'd):"
		# puts "The roll after you place your 'Come' bet determines" 
		# puts "a personal win, loss or point."
		# puts "Just like a 'Pass' bet, 7 is a win, 2, 3, and 12 are a loss,"
		# puts "and 4, 5, 6, 8, 9, 10 establish a point."
		# puts "Remember that the game-wide point is not affected"
		# puts "by the personal point established for your 'Come' bet."
		# puts "Re-rolling the 'Come' point results in a win (1:1)"
		# puts "Rolling a 7 results in a loss (0:1)."
		puts "THE END\n"
	end

	def reset_var
		@pass = nil
		@pass_bet = nil
		@game_point = nil
		@odds = nil
		@odds_bet = nil
		@roll = nil
	end

	def pass_bet_check
		if @pass_bet.to_i >= @player.bankroll.to_i
			reset_var
			@message = "Enter a valid bet! Min is $10. Max is $#{'%.02f' % @player.bankroll}."
		else
			@message = "Bet placed! Roll!"
			@player.bankroll = @player.bankroll.to_i - @pass_bet.to_i
		end
	end

	def roll1
		if @roll == nil
			@roll = 2 + rand(6) + rand(6)
			come_out_roll
		elsif @roll
			@roll = 2 + rand(6) + rand(6)
			point_rolls
		end
	end

	def come_out_roll
		if @pass == "Don't Pass"
			case @roll
			when 2, 3
				@player.bankroll.to_f += @pass_bet * 2
				@message = "Come out roll is...#{@roll}! You won! Your #{@pass} bet of $#{'%.02f' % @pass_bet} returned $#{'%.02f' % (@pass_bet * 2)}."
				reset_var
			when 7, 11
				@message = "Come out roll is...#{@roll}! Your #{@pass} bet lost $#{'%.02f' % @pass_bet}."
				reset_var
			when 4, 10, 5, 9, 6, 8
				@game_point = @roll
				@message = "Come out roll is...#{@roll}! The game point is now #{@game_point.to_i}. Roll again!"
			else
				@player.bankroll += @pass_bet
				@message = "Come out roll is...#{@roll}! A tie! Nobody wins or loses anything."
				reset_var
			end
		elsif @pass == "Pass"
			case @roll
			when 7, 11
				@player.bankroll += @pass_bet * 2
				@message = "Come out roll is...#{@roll}! You won! Your #{@pass} bet of $#{'%.02f' % @pass_bet} returned $#{'%.02f' % (@pass_bet * 2)}."
				reset_var
			when 2, 3, 12
				@message = "Come out roll is...#{@roll}! Your #{@pass} bet lost $#{'%.02f' % @pass_bet}."
				reset_var
			when 4, 10, 5, 9, 6, 8
				@game_point = @roll
				@message = "Come out roll is...#{@roll}! The game point is now #{@game_point.to_i}. Roll again!"
			else
				@player.bankroll += @pass_bet
				@message = "Come out roll is...#{@roll}! A tie! Nobody wins or loses anything."
				reset_var
			end
		end
	end

	def point_rolls
		puts "Point roll is...#{@roll}!"
		if @roll != @game_point && @roll != 7
			@message = "Point roll is...#{@roll}! Nothing yet! Roll again!"
		elsif @pass == "Don't Pass" && @roll == 7
			@player.bankroll += @pass_bet * 2
			@message = "Point roll is...#{@roll}! You won! Your #{@pass} bet of $#{'%.02f' % @pass_bet} returned $#{'%.02f' % (@pass_bet * 2)}."
			odds_win
			reset_var
		elsif @pass == "Don't Pass" && @roll == @game_point
			@message = "Point roll is...#{@roll}! Your #{@pass} bet lost $#{'%.02f' % @pass_bet}."
			odds_loss
			reset_var
		elsif @pass == "Pass" && @roll == @game_point
			@player.bankroll += @pass_bet * 2
			@message = "Point roll is...#{@roll}! You won! Your #{@pass} bet of $#{'%.02f' % @pass_bet} returned $#{'%.02f' % (@pass_bet * 2)}."
			odds_win
			reset_var
		elsif @pass == "Pass" && @roll == 7
			@message = "Point roll is...#{@roll}! Your #{@pass} bet lost $#{'%.02f' % @pass_bet}."
			odds_loss
			reset_var
		else
			puts "This is impossible!"
		end
	end

	def odds_bet_check
		if @odds_bet >= @player.bankroll.to_f
			@odds = nil
			@odds_bet = nil
			@message = "Enter a valid bet! Min is $10. Max is $#{'%.02f' % @player.bankroll}."
		else
			@message = "Odds bet placed! Roll!"
			@player.bankroll = @player.bankroll - @odds_bet
			@odds = true
		end
	end

	def odds_win
		if @odds == true
		else
			return
		end
		if @pass == "Pass" && @odds == true
			case @game_point.to_i
			when 4, 10
				odds_win_result(3)
			when 5, 9
				odds_win_result(2.5)
			when 6, 8
				odds_win_result(2.2)
			else
				return
			end
		elsif @pass == "Don't Pass" && @odds == true
			case @game_point.to_i
			when 4, 10
				odds_win_result(1.5)
			when 5, 9
				odds_win_result(1.667)
			when 6, 8
				odds_win_result(1.833)
			else
				return
			end
		end
	end

	def odds_win_result(mult)
		winnings = @odds_bet * mult
		@player.bankroll += winnings
		@message = "#{@message} And your Odds bet won $#{'%.02f' % winnings}!"
	end



	def odds_loss
		if @odds == true
			@message = "#{@message} Your Odds bet lost $#{'%.02f' % @odds_bet}."
		end
	end

end

