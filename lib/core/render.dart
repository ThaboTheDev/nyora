import 'package:nyora/console/game_console.dart';
import 'package:nyora/world/position.dart';
import 'package:nyora/world/world.dart';

class Render {
  final World _world;
  final GameConsole _console;

  Render(this._world, this._console);

  void render() {
    final buffer = StringBuffer();

    for (int y = 0; y < _world.height; y++) {
      final line = StringBuffer();
      for (int x = 0; x < _world.width; x++) {
        line.write(_world.charAt(Position(x, y)));
      }
      buffer.writeln(line.toString());
    }

    _console.write(buffer.toString());
  }

  void clear() => _console.clearScreen();
}