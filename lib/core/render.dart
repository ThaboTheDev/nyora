import 'package:nyora/console/game_console.dart';
import 'package:nyora/world/position.dart';
import 'package:nyora/world/world.dart';

class Render {
  // Rendering logic here
  final World _world;
  final GameConsole _console;

  Render(this._world, this._console);

  void render() {
    // Render the world to the console
    for (int y = 0; y < _world.height; y++) {
      String line = '';
      for (int x = 0; x < _world.width; x++) {
        line += _world.charAt(Position(x, y));
      }
      _console.writeLine(line);
    }
  }

  void clear() {
    _console.clearScreen();
  }
}
