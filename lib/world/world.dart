import 'dart:math';

import 'package:nyora/world/position.dart';

import 'map_generator.dart';

class World {
  late List<List<String>> map;
  Random random = Random();

  World({int width = 10, int height = 6, bool random = false}) {
    // generate map instead of hardcoding
    if (random) {
      map = MapGenerator.generateRandomMap(width, height);
    } else {
      map = MapGenerator.generateBasicMap(width, height);
    }
  }

  bool _isWalkable(Position pos){
    if (pos.getX < 0 || pos.getY >= map.length) return false;
    if (pos.getX < 0 || pos.getX >= map[pos.getY].length) return false;
    return map[pos.getY][pos.getX] != '#';
  }

  int get width => map[0].length;
  int get height => map.length;

  String charAt(Position pos) {
    return map[pos.getY][pos.getX];
  }

  void setCharAt(Position pos, String char) {
    map[pos.getY][pos.getX] = char;
  }

  Position findEmptyPosition() {
    List<Position> emptyPositions = [];
    for (int y = 1; y < height - 1; y++) {
      for (int x = 1; x < width - 1; x++) {
        Position pos = Position(x, y);
        if (_isWalkable(pos)) {
          emptyPositions.add(pos);
        }
      }
    }
    return emptyPositions.isNotEmpty
        ? emptyPositions[random.nextInt(emptyPositions.length - 1)]
        : Position(1, 1); // Fallback
  }

  bool movePlayer(Position currentPos, Position newPos) {
    if (_isWalkable(newPos)) {
      // Move player character
      setCharAt(currentPos, '.'); // Clear old position
      setCharAt(newPos, '@'); // Set new position
      return true;
    }
    return false; // Move blocked
  }
}
