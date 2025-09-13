import 'dart:io';

import 'package:dart_console/dart_console.dart';
import 'package:nyora/console/game_console.dart';
import 'package:nyora/core/input.dart';

class GameMenu {
  final GameConsole _console;
  final Input _input;

  GameMenu(this._console, this._input);

  void showMainMenu() {
    bool inMenu = true;

    while (inMenu) {
      _console.clearScreen();
      _console.writeLine('==============================');
      _console.writeLine('       ADVENTURE GAME         ');
      _console.writeLine('==============================');
      _console.writeLine('1. Start Game');
      _console.writeLine('2. Instructions');
      _console.writeLine('3. Quit');

      switch (_input.getInput().char) {
        case '1':
          inMenu = false; // break loop and start game
          break;
        case '2':
          _showInstructions();
          break;
        case '3':
          _console.writeLine('Goodbye!');
          exit(0);
        default:
          _console.writeLine('Invalid choice, press Enter to try again.');
          stdin.readLineSync();
      }
    }
  }

  void _showInstructions() {
    _console.clearScreen();
    _console.writeLine('=== Instructions ===');
    _console.writeLine('W - Move Up');
    _console.writeLine('A - Move Left');
    _console.writeLine('S - Move Down');
    _console.writeLine('D - Move Right');
    _console.writeLine('Q - Quit Game');
    _console.writeLine('P - Pause Game');
    _console.writeLine('\nPress Enter to return to the main menu.');

    while (_input.getInput().controlChar != ControlCharacter.enter) {
      // wait for Enter key
    }
  }

  /// Called when player pauses the game
  /// Returns true if player wants to resume, false if quit to menu.
  bool showPauseMenu() {
    while (true) {
      _console.clearScreen();
      _console.writeLine('=== PAUSED ===');
      _console.writeLine('1. Resume Game');
      _console.writeLine('2. Instructions');
      _console.writeLine('3. Quit to Main Menu');
      stdout.write('Select an option (1-3): ');

      switch (_input.getInput().char) {
        case '1':
          return true; // resume
        case '2':
          _showInstructions();
          break;
        case '3':
          return false; // quit to main menu
        default:
          _console.writeLine('Invalid choice, press Enter to try again.');
          stdin.readLineSync();
      }
    }
  }
}
