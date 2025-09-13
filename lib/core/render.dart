import 'package:nyora/console/game_console.dart';
import 'package:nyora/world/world.dart';

class Render {
  // Rendering logic here
  final World _world;
  final GameConsole _console;

  Render(this._world, this._console);

  void render() {
    // Render the world to the console
    for (var row in _world.map) {
      _console.writeLine(row);
    }
  }

  void clear() {
    _console.clearScreen();
  }
}
