# Mastermind
Created to showcase object oriented programming with Ruby. Done as part of The Odin Project. Runs in the terminal.

[Repl.it](https://repl.it/@shanedgilbert/Mastermind)

## How It Works:
- A functional game of Mastermind. 
- Instead of 6 different colors, we use 4 digits ranging from 1000-9999.
- "X" is used to show correct value and position
- "O" is used to show correct value and incorrect position
- "_" is used to show incorrect value and incorrect position
- 1. Codebreaker: The computer generates a random 4 digit number and the user has 12 turns to guess the correct number. 
  2. Codemaker: The user inputs a 4 digit number and the computer has 12 turns to determine the correct number
- Prompts the user if they would like to play again upon game completion

## Reflections
I made many more mistakes with this project as opposed to the Tic-Tac-Toe game. It also required much more logic and thinking to figure out a solution to several of the hurdles. The computer cracking algorithm could also use more work as it has a low success chance within 12 rounds, however, it has a 100% success chance if given enough rounds.

### Successes
One of the major takeaways from this project was several code refactorings that I did. Initially, I created a long method to solve a simple issue and further along with the project, I determined an easier way to do the same thing with much less code.

For example, when comparing the individual digits for similarities ("X", "O", "_"), I would separate each integer using a combination of division and modulus. <br> When I went back and looked through the code, I figured that I could convert the integer into a String and use indexing to acquire the individual digits. This was a much more efficient and clean approach to the problem

### Challenges
1. Due to my limited understanding of the game itself, it took me quite a while to determine how my game would be played. The original board game is played with 6 different colors and pegs whereas my game is played using a 4 digit number ranging from 1000-9999.<br><br>
2. Another issue I ran into was determing how to crack the code (cracking algorithm). Many examples of the game used an instance of the Knuth algorithm to solve the game but that was typically applied to the original game where there are around 1300 possible solutions. My game has around 9000 possible solutions and thus would take considerably longer to solve using the Knuth algorithm. I ended up using a simple algorithm that uses random numbers until it finds a match ("X") and then continues, skipping the match, until it either runs out of turns or cracks the code.

## Version History
1.0 completed 7/26/2020