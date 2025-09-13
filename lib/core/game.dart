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
      width: _console.windowWidth - 5,
      height: _console.windowHeight - 5,
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

      if (key.char == 'q') {
        stop();
      }

      if (key.char == 'p') {
        pause();
      }

      if (key.char == 'h') {
        help();
      }

      handleKeyPress(key, player);
    }
  }

  void handleKeyPress(Key key, Player player) {
    // Key press handling logic here
    switch (key.char) {
      case "w" || "W":
        Position newPos = Position(player.pos.getX, player.pos.getY - 1);

        if (_world.movePlayer(player.pos, newPos)) {
          player.setPos = newPos;
        }
        break;

      case "a" || "A":
        Position newPos = Position(player.pos.getX - 1, player.pos.getY);
        if (_world.movePlayer(player.pos, newPos)) {
          player.setPos = newPos;
        }
        break;

      case "s" || "S":
        Position newPos = Position(player.pos.getX, player.pos.getY + 1);
        if (_world.movePlayer(player.pos, newPos)) {
          player.setPos = newPos;
        }
        break;

      case "d" || "D":
        Position newPos = Position(player.pos.getX + 1, player.pos.getY);
        if (_world.movePlayer(player.pos, newPos)) {
          player.setPos = newPos;
        }
        break;
      default:
        // Unhandled key
        break;
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
