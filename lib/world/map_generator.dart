class MapGenerator {
  /// Generate a rectangular map with walls on the edges
  /// width x height defines the map size
  static List<List<String>> generateBasicMap(int width, int height) {
    List<List<String>> rows = [];

    for (int y = 0; y < height; y++) {
      List<String> row = [];
      for (int x = 0; x < width; x++) {
        // Edges are walls
        if (_isWall(x, y, width, height)) {
          row.add('#');
        } else {
          // Fill with floor dots
          row.add('.');
        }
      }
      rows.add(row);
    }

    return rows;
  }

  /// Generate a map with a random scattering of walls inside
  static List<List<String>> generateRandomMap(
    int width,
    int height, {
    double wallChance = 0.1,
  }) {
    final random = DateTime.now().millisecondsSinceEpoch % 4294967295;
    // We’ll do a simple pseudo random by mod
    int seed = random;
    List<List<String>> rows = [];

    for (int y = 0; y < height; y++) {
      List<String> row = [];
      for (int x = 0; x < width; x++) {
        if (_isWall(x, y, width, height)) {
          row.add('#'); // boundary walls
        } else {
          seed = (seed * 1103515245 + 12345) & 0x7fffffff; // simple LCG
          double randVal = seed / 0x7fffffff;
          if (randVal < wallChance) {
            row.add('#');
          } else {
            row.add('.');
          }
        }
      }
      rows.add(row);
    }

    return rows;
  }

  static bool _isWall(int x, int y, int width, int height) {
    return y == 0 || y == height - 1 || x == 0 || x == width - 1;
  }
}
