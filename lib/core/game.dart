import 'package:nyora/console/game_console.dart';
import 'package:nyora/core/game_menu.dart';
import 'package:nyora/core/input.dart';
import 'package:nyora/core/render.dart';
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
    }
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
