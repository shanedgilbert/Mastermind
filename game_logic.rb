class GameLogic
  # Runs the game as the codebreaker
  def codebreaker
    computer_number = rand(1000..9999)
    # puts "computer number: #{computer_number}"

    guesses = 1
    puts "The computer has chosen a 4 digit code and it is now your turn to crack it! \n"

    # Loops 12 times for 12 guesses
    while guesses < 13 do
      puts "What is your guess? [1000-9999] (guess #{guesses}) \n"
      guess_input = four_digit_input_checker

      return_string = number_compare(guess_input, computer_number)

      puts "Result: #{return_string}"
      if return_string == "XXXX"
        puts "You win! \n"
        puts "It only took you #{guesses} guesses"
        break
      elsif guesses == 11 && return_string != "XXXX"
        puts "You lost. The correct code was #{computer_number}"
      end
      guesses += 1
    end
  end

  # Runs the game as the codemaker
  def codemaker
    puts "Enter a 4 digit number: (1000-9999)"
    guess_code = four_digit_input_checker
    list_of_possible = (1000..9999).to_a

    # Loops the algorithm up to 12 times (12 rounds)
    guesses = 1
    compare_result = "____"
    computer_guess = 0000
    while guesses < 13 do
      computer_guess = computer_guess_algorithm(computer_guess, compare_result)
      compare_result = number_compare(computer_guess, guess_code)
      puts "Computer's guess: #{computer_guess} (Guess #{guesses})"
      puts "Computer's accuracy: #{compare_result} \n\n"

      # Game ending statements
      if compare_result == "XXXX"
        puts "The computer guessed your code in #{guesses} guesses!"
        break
      elsif compare_result != "XXXX" && guesses == 12 
        puts "The computer could not crack your code!"
        break
      end
      guesses += 1
    end
  end

  # Checks for valid 4 digit input
  def four_digit_input_checker
    four_digit_input_check = true
    while four_digit_input_check do
      input = gets.to_i
      if input < 1000 || input > 9999
        puts "Invalid input. Please try again"
      else
        four_digit_input_check = false
      end
    end
    return input
  end

  # Compares the 2 four digit numbers for similarities and returns a string to indicate relativity
  def number_compare(guess_input, computer_number)
    return_string = "0000"

    guess_input_string = guess_input.to_s
    computer_number_string = computer_number.to_s

    for i in 0..guess_input.size - 1
      if guess_input_string[i] == computer_number_string[i]
        return_string[i] = "X"
      elsif computer_number_string.include? (guess_input_string[i])
        return_string[i] = "O"
      else
        return_string[i] = "_"
      end
    end
    return return_string
  end

  # Cracking algorithm for codemaker
  def computer_guess_algorithm(previous_guess, accuracy_string)
    new_guess = "0000"
    previous_guess_string = previous_guess.to_s
    for i in 0..previous_guess_string.size - 1
      if accuracy_string[i] == "X"
        new_guess[i] = previous_guess_string[i]
      elsif accuracy_string[i] != "X" && i == 0
        new_guess[i] = rand(1..9).to_s
      else
      new_guess[i] = rand(0..9).to_s
      end
    end
    return new_guess.to_i
  end
end