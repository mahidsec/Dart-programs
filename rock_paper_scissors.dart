import 'dart:math';
import 'dart:io';

enum Moves { rock, paper, scissors }

void main() {
  // loop
  // Show a prompt
  // Read user input
  // if input is valid
  //    choose AI move as random
  //    compare
  //    show result
  // else if input q
  //  Quit
  // else
  //    invalid input
  final rng = Random();
  while (true) {
    stdout.write('Rock, paper or scissor? (r/p/s q to quit): ');
    final userInput = stdin.readLineSync();

// Validating user input
    if (userInput == 'r' || userInput == 'p' || userInput == 's') {
      // Assigning moves & Printing syntax
      var playerMove;
      var styledMove;
      if (userInput == 'r') {
        playerMove = Moves.rock;
        styledMove = '🪨 Rock';
      } else if (userInput == 'p') {
        playerMove = Moves.paper;
        styledMove = '📄 Paper';
      } else {
        playerMove = Moves.scissors;
        styledMove = '✂️ Scissors';
      }

      // Generating random number for AI move
      final random = rng.nextInt(3);
      final aiMove = Moves.values[random];

      // Styled AI move
      var styledAi;
      if (aiMove == Moves.rock) {
        styledAi = '🪨 Rock';
      } else if (aiMove == Moves.paper) {
        styledAi = '📄 Paper';
      } else {
        styledAi = '✂️ Scissors';
      }

      // Printing selected inputs.
      print('You played: $styledMove');
      print('AI played: $styledAi');

      // Implimenting game logic
      if (playerMove == aiMove) {
        print('⚔️ It\'s a draw!\n');
      } else if (playerMove == Moves.rock && aiMove == Moves.scissors ||
          playerMove == Moves.paper && aiMove == Moves.rock ||
          playerMove == Moves.scissors && aiMove == Moves.paper) {
        print('🏆️ You win!\n');
      } else {
        print('🌸 AI win!\n');
      }

      // Catch q to quit
    } else if (userInput == 'q') {
      break;
    } else {
      print('⛔️ Invalid input!');
    }
  }
}
