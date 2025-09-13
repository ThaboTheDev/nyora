import 'dart:io';

import 'package:dart_console/dart_console.dart';

class GameConsole extends Console {
  @override
  void clearScreen() {
    stdout.write('\x1B[3J'); // Clear scroll buffer
    stdout.write('\x1B[2J'); // Clear visible screen
    stdout.write('\x1B[H'); // Cursor to home
    stdout.write('\x1Bc'); // Full terminal reset
  }
}
