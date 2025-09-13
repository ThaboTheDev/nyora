class Player {
  int _x;
  int _y;
  final String name;
  String char = '@';

  Player(this._x, this._y, this.name);

  int get x => _x;
  int get y => _y;

  set setX(int value) {
    _x = value;
  }

  set setY(int value) {
    _y = value;
  }
}