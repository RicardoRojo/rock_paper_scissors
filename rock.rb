# rock, paper, scissors, lizard, Spock. A variant of rock, paper scissors
# By Ricardo Rojo
# 28/02/2015
# ============
# RIP Leonard Nimoy. Thanks for all the good moments
# ============
# Operations taken from http://en.wikipedia.org/wiki/Rock-paper-scissors
def print_instructions
  puts " Play rock-paper-scissors-lizard-Spock !".center(50)
  puts "\nROCK crashes scissors and lizard"
  puts "PAPER covers rock and disproves Spock"
  puts "SCISSORS cuts paper and decapitates lizard"
  puts "LIZARD eats paper and poisons Spock"
  puts "SPOCK vaporizes rock and smashes scissors"
  puts "=========================================="
end

def total_results(game_stats)
  puts "Game Stats".center(50)
  puts "Number of games played #{game_stats['games_played']}"
  puts "Number of games won #{game_stats['player_wins']}"
  puts "Number of games lost #{game_stats['computer_wins']}"
  puts "Number of draws #{game_stats['draw']}"
end

def who_wins(player_play, computer_play, plays,results)
  game_result = (plays.key(player_play) - computer_play) % 5
  if game_result.odd?
    puts "#{player_play} #{results[player_play][game_result]} #{plays[computer_play]}." + " You WIN!!"
    return "player_wins"
  elsif game_result == 0
    puts "It´s a draw"
    return "draw"
  else
    game_result = (computer_play - plays.key(player_play) ) % 5
    puts "#{plays[computer_play]} #{results[plays[computer_play]][game_result]} #{player_play}." + " You loose!!"
    return "computer_wins"
  end
end

print_instructions 

# counters
game_stats = {"games_played" => 0, "player_wins" => 0, "computer_wins" => 0, "draw" => 0}

# values hashes
plays = {1 => "rock", 2 => "paper", 3 => "scissors", 4 => "spock", 5 => "lizard"}
results = {"rock" => {1 => "crushes ", 3 => "crushes "}, "paper" => {1 => "covers ", 3 => "disproves "}, "scissors" => {1 => "cuts ", 3 => "decapitates"}, "spock" => {1 => "smashes ", 3 => "vaporizes "}, "lizard" => {1 => "poisons ", 3 => "eats "}}
error_message = ["Oopps, wrong option.", "Option is wrong, try again", "That option is not logic, choose again"]

# Action
begin
  puts "choose: rock paper scissors lizard spock (exit for ending)".center(50)
  player_play = gets.chomp.downcase
  game_stats["games_played"] += 1 unless player_play == "exit"
  
  if player_play == "exit"
    break
  elsif results[player_play].nil? 
    puts error_message.sample
  else
    computer_play = rand(1..5)
    puts "computer choice #{plays[computer_play]}"
    game_stats[who_wins(player_play,computer_play,plays,results)] += 1
  end
end while player_play != "exit" 

# results
total_results(game_stats)