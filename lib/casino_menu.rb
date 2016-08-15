#updating master
#this pulls in the player class from the other file, not caps since its pulling the file itself
#require_relative 'wallet' ??
require_relative './player'
require_relative './all_games'

class Intro
  def casino
    puts ""
    puts "Welcome to the Casino!"
    puts "Please enter your name:"
    print "-->"
    player = gets.chomp
    if player.downcase == "exit"
      puts "Have a great day"
      exit 0
    else
      puts "Please enter in the amount of money you brought with you:"
      print "-->"
      wallet = gets.chomp.to_i
      
      # For now, just one player
      # Should allow as many players
      # Should Switch between players
      @player = Player.new(player, wallet)
    end

    casino_menu(@player)
  end

  def casino_menu(player)
    @player = player
    puts "You're name is #{player.name} and you have #{player.wallet.total} in your wallet."
    puts "Please select 1 - 5 from our list of games"
    puts "1. Slots"
    puts "2. Hi-Lo"
    puts "3. War"
    puts "4. Russian roulette"
    puts "5. Check Wallet"
    puts "6. Exit the casino"

    main_menu = gets.chomp

    case main_menu
      when "1"
        slot = Slots.new(@player)
        slot.slot_machine
      when "2"
        hilo = HighLow.new(@player)
        hilo.high_low
      when "3"
        puts "Currently under construction. Check back soon!"
        sleep(2)
        casino_menu(@player)
        # wars = War.new(@player)
        # wars.war_game
      when "4"
        rush = RussianRoulette.new(@player)
        rush.russian_roulette
      when "5"
        puts "Your wallet has: $#{@player.wallet.total}"
        puts "To keep going, press 1. To cut your losses and exit, press 2"
        print "-->"
        money_check = gets.chomp
        if money_check == "1" 
          casino_menu(@player)
        elsif money_check == "2"
          puts "Thanks for playing, you're leaving with $ #{@player.wallet.total}!"
          exit (0)
        else 
          puts "Invalid option, please select 1 or 2"
          casino_menu(@player)
        end
      when '6'
        puts "Thanks for playing, you're leaving with $ #{@player.wallet.total}"
        exit 0
      else
        puts "Invalid option, please select 1-5"
        main_menu
    end
  end
end

intro = Intro.new
intro.casino