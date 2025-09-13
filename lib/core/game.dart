import 'package:dart_console/dart_console.dart';
import 'package:nyora/console/game_console.dart';
import 'package:nyora/core/game_menu.dart';
import 'package:nyora/core/input.dart';
import 'package:nyora/core/render.dart';
import 'package:nyora/entities/player.dart';
import 'package:nyora/world/position.dart';
import 'package:nyora/world/world.dart';

class Game {
  late GameConsole _console;
  late GameMenu _menu;
  late Input _input;
  late World _world;
  late Render _render;
  bool running = true;

  Game() {
    _console = GameConsole();
    _input = Input(_console);
    _menu = GameMenu(_console, _input);
    _world = World(
      width: _console.windowWidth - 60,
      height: _console.windowHeight - 30,
      random: true,
    );
    _render = Render(_world, _console);
  }

  void start() {
    // Game starting logic here
    _console.clearScreen();
    _console.writeLine('Welcome to Nyora!');
    _menu.showMainMenu();

    var pos = _world.findEmptyPosition();
    Player player = Player(pos, "Hero");
    _world.setCharAt(pos, player.char);

    while (running) {
      _console.clearScreen();
      _console.writeLine('Game is running... Press "p" to pause, "q" to quit.');
      _render.render();
      final key = _input.getInput();

      if (key.char.toLowerCase() == 'q') {
        stop();
      }

      if (key.char.toLowerCase() == 'p') {
        pause();
      }

      if (key.char.toLowerCase() == 'h') {
        help();
      }

      handleKeyPress(key, player);
    }
  }

  void handleKeyPress(Key key, Player player) {
    // normalize the input to lowercase so we don’t duplicate code
    final pressedKey = key.char.toLowerCase();

    // current position
    final x = player.pos.getX;
    final y = player.pos.getY;

    Position newPos;

    switch (pressedKey) {
      case 'w':
        newPos = Position(x, y - 1);
        break;

      case 'a':
        newPos = Position(x - 1, y);
        break;

      case 's':
        newPos = Position(x, y + 1);
        break;

      case 'd':
        newPos = Position(x + 1, y);
        break;

      default:
        // unhandled key
        return;
    }

    // Move the player if the world allows it
    if (_world.movePlayer(player.pos, newPos)) {
      player.setPos = newPos; // use the actual setter
    }
  }


  void help() {
    // Help logic here
    _console.clearScreen();
    _console.writeLine('Help Menu:');
    _console.writeLine('Use arrow keys to move.');
    _console.writeLine('Press "p" to pause the game.');
    _console.writeLine('Press "q" to quit the game.');
    _console.writeLine('Press any key to return to the main menu.');
    _input.getInput();
    _menu.showMainMenu();
  }

  void stop() {
    // Game stopping logic here
    _console.clearScreen();
    _console.writeLine('Thanks for playing Nyora!');
    running = false;
  }

  void pause() {
    // Pause game logic here
    bool resume = _menu.showPauseMenu();
    if (!resume) {
      _menu.showMainMenu();
    }
  }

  bool isRunning() => running;

  GameConsole get console => _console;

  GameMenu get menu => _menu;

  Input get input => _input;
}
