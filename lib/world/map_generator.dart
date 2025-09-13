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
    // Linear Congruential Generator for deterministic randomness
    int seed = DateTime.now().millisecondsSinceEpoch & 0x7fffffff;

    double nextRandom() {
      seed = (seed * 1103515245 + 12345) & 0x7fffffff;
      return seed / 0x7fffffff;
    }

    // Helper to check if a cell is a border wall
    bool isBoundary(int x, int y) =>
        x == 0 || y == 0 || x == width - 1 || y == height - 1;

    final rows = List<List<String>>.generate(height, (y) {
      return List<String>.generate(width, (x) {
        if (isBoundary(x, y)) return '#'; // always walls on borders
        return nextRandom() < wallChance ? '#' : '.';
      });
    });

    return rows;
  }


  static bool _isWall(int x, int y, int width, int height) {
    return y == 0 || y == height - 1 || x == 0 || x == width - 1;
  }
}
