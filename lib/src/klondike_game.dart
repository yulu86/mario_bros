import 'package:flame/game.dart';

class KlondikeGame extends FlameGame {
  @override
  Future<void>? onLoad() async {
    var image = await images.load('klondike-sprites.png');
  }
}
