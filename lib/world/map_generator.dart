class MapGenerator {
  /// Generate a rectangular map with walls on the edges
  /// width x height defines the map size
  static List<String> generateBasicMap(int width, int height) {
    List<String> rows = [];

    for (int y = 0; y < height; y++) {
      StringBuffer row = StringBuffer();
      for (int x = 0; x < width; x++) {
        // Edges are walls
        if (y == 0 || y == height - 1 || x == 0 || x == width - 1) {
          row.write('#');
        } else {
          // Fill with floor dots
          row.write('.');
        }
      }
      rows.add(row.toString());
    }

    return rows;
  }

  /// Generate a map with a random scattering of walls inside
  static List<String> generateRandomMap(
    int width,
    int height, {
    double wallChance = 0.1,
  }) {
    final random = DateTime.now().millisecondsSinceEpoch % 4294967295;
    // We’ll do a simple pseudo random by mod
    int seed = random;
    List<String> rows = [];

    for (int y = 0; y < height; y++) {
      StringBuffer row = StringBuffer();
      for (int x = 0; x < width; x++) {
        if (y == 0 || y == height - 1 || x == 0 || x == width - 1) {
          row.write('#'); // boundary walls
        } else {
          seed = (seed * 1103515245 + 12345) & 0x7fffffff; // simple LCG
          double randVal = seed / 0x7fffffff;
          if (randVal < wallChance) {
            row.write('#');
          } else {
            row.write('.');
          }
        }
      }
      rows.add(row.toString());
    }

    return rows;
  }
}
