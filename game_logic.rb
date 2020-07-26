class GameLogic
  # Runs the game as the codebreaker
  def codebreaker
    
  end

  # Runs the game as the codemaker
  def codemaker
    computer_number = rand(1000..9999)
    puts "computer number: #{computer_number}"

    # Calculates the individual digits for the computer's number
    computer_digit_1 = computer_number / 1000
    computer_digit_2 = (computer_number % 1000) / 100
    computer_digit_3 = ((computer_number % 1000) % 100) / 10
    computer_digit_4 = (((computer_number % 1000) % 100) % 10)

    guesses = 0
    puts "The computer has chosen a 4 digit code and it is now your turn to crack it! \n"

    # Loops 12 times for 12 guesses
    while guesses < 13 do
      puts "What is your guess? (guess #{guesses + 1}) \n"
      return_string = ""

      # Checks for valid 4 digit input
      four_digit_input_check = true
      while four_digit_input_check do
        guess_input = gets.to_i
        if guess_input < 1000 || guess_input > 9999
          puts "Invalid input. Please try again"
        else
          four_digit_input_check = false
        end
      end

      # Calculates the individual digits for the user's guess
      player_digit_1 = guess_input / 1000
      player_digit_2 = (guess_input % 1000) / 100
      player_digit_3 = ((guess_input % 1000) % 100) / 10
      player_digit_4 = (((guess_input % 1000) % 100) % 10)

      if computer_digit_1 == player_digit_1
        return_string = return_string + "X"
      elsif computer_digit_1 == player_digit_2 || computer_digit_1 == player_digit_3 || computer_digit_1 == player_digit_4
        return_string = return_string + "O"
      end
      if computer_digit_2 == player_digit_2
        return_string = return_string + "X"
      elsif computer_digit_2 == player_digit_1 || computer_digit_2 == player_digit_3 || computer_digit_2 == player_digit_4
        return_string = return_string + "O"
      end
      if computer_digit_3 == player_digit_3
        return_string = return_string + "X"
      elsif computer_digit_3 == player_digit_1 || computer_digit_3 == player_digit_2 || computer_digit_3 == player_digit_4
        return_string = return_string + "O"
      end
      if computer_digit_4 == player_digit_4
        return_string = return_string + "X"
      elsif computer_digit_4 == player_digit_1 || computer_digit_4 == player_digit_2 || computer_digit_4 == player_digit_3
        return_string = return_string + "O"
      end
      puts "Result: #{return_string}"
      if return_string == "XXXX"
        puts "You win! \n"
        puts "It only took you #{guesses + 1} guesses"
        break
      end
      guesses += 1
    end
  end
end