# rock, paper, scissors, lizard, Spock. A variant of rock, paper scissors
# By Ricardo Rojo
# 28/02/2015
# ============
# RIP Leonard Nimoy. Thanks for all the good moments
# ============
# Operations taken from http://en.wikipedia.org/wiki/Rock-paper-scissors
def instructions
  puts "rock-paper-scissors-lizard-Spock".center(50)
  50.times {print "="}
  puts "\nROCK crashes scissors and lizard"
  puts "PAPER covers rock and disproves Spock"
  puts "SCISSORS cuts paper and decapitates lizard"
  puts "LIZARD eats paper and poisons Spock"
  puts "SPOCK vaporizes rock and smashes scissors"
  50.times {print "="}
  puts "\n Tip: Spock is the best"
end

def total_results(games_played)
  puts "\n Number of games played #{games_played}".center(50)
  puts "\n Number of games won #{@games_won}"
  puts "\n Number of games lost #{@games_lost}"
end

def who_wins(player_play)
  computer_play = rand(1..5)
  puts "computer choice #{@choices[computer_play]}"
  game_result = (@choices.key(player_play) - computer_play) % 5
  puts "game result is #{game_result}"
  if (game_result.odd?)
    puts "#{player_play} #{@results[player_play][game_result]} #{@choices[computer_play]}." + " You WIN!!"
    @games_won += 1
  elsif game_result == 0
    puts "It´s a draw"
  else
    game_result = (computer_play - @choices.key(player_play) ) % 5
    @games_lost += 1
    puts "#{@choices[computer_play]} #{@results[@choices[computer_play]][game_result]} #{player_play}." + " You loose!!"
  end
end

instructions # show instructions

# counters
games_played = 0 
@games_won = 0
@games_lost = 0

# values hashes
@choices = {1 => "rock", 2 => "paper", 3 => "scissors", 4 => "spock", 5 => "lizard"}
@results = {"rock" => {1 => "crushes ", 3 => "crushes "}, "paper" => {1 => "covers ", 3 => "disproves "}, "scissors" => {1 => "cuts ", 3 => "decapitates"}, "spock" => {1 => "smashes ", 3 => "vaporizes "}, "lizard" => {1 => "poisons ", 3 => "eats "}}
error_message = ["upps, wrong option.", "Option is wrong, try again", "That option is not logic, choose again"]

# Action
begin
  puts "choose: rock paper scissors lizard spock (exit for ending)".center(50)
  player_play = gets.chomp.downcase
  games_played += 1 unless player_play == "exit"
  
  if player_play == "exit"
    break
  elsif @results[player_play].nil? 
    puts error_message.sample
  else
    who_wins(player_play)
  end
end while player_play != "exit" 

# results
total_results(games_played)