import 'map_generator.dart';

class World {
  late List<String> map;

  World({int width = 10, int height = 6, bool random = false}) {
    // generate map instead of hardcoding
    if (random) {
      map = MapGenerator.generateRandomMap(width, height);
    } else {
      map = MapGenerator.generateBasicMap(width, height);
    }
  }

  bool isWalkable(int x, int y) {
    if (y < 0 || y >= map.length) return false;
    if (x < 0 || x >= map[y].length) return false;
    return map[y][x] != '#';
  }

  int get width => map[0].length;
  int get height => map.length;

  String charAt(int x, int y) {
    return map[y][x];
  }
}
