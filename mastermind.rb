# Main, where the game is started
require_relative "game_logic"

game_repeat = true
while game_repeat do
  puts "Different ways to play: \n
        Codebreaker: \n
        - You have 12 turns to guess the codemaker's number \b
        - X = Correct number and position \b
        - O = Correct number and incorrect position \b
        - blank = Incorrect number and incorrect position \n
        Codemaker: \n
        - Enter a 4 digit number ranging from 1000-9999 \b
        - The codebreaker has 12 turns to guess your number \n\n"
  puts "How would you like to play? \n
        1. Codebreaker \b
        2. Codemaker"

  # Prompts the user to choose which gamemode they would like to play
  correct_play_input = false
  until correct_play_input do
    play_input = gets.to_i
    if play_input > 0 and play_input < 3
      correct_play_input = true
    else puts "Incorrect input. Please try again"
    end
    running_game = GameLogic.new()
    if play_input == 1
      running_game.codebreaker
    elsif play_input == 2
      running_game.codemaker
    end
  end

  # Handles game repetition on game end
  invalid_input = true
  while invalid_input do
    puts "Would you like to play again? (Y/N)"
    game_repeat_input = gets.to_s.chomp.upcase
    if game_repeat_input != "Y" && game_repeat_input != "N"
      puts "Invalid input"
    else 
      invalid_input = false
    end
  end
  if game_repeat_input == "N"
    game_repeat = false
  end
end