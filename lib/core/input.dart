import 'package:dart_console/dart_console.dart';
import 'package:nyora/console/game_console.dart';

class Input {
  final GameConsole _console;
  Input(this._console);

  Key getInput() {
    Key input = _console.readKey();
    return input;
  }
}
