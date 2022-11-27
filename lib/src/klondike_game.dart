import 'package:flame/components.dart';
import 'package:flame/game.dart';

class KlondikeGame extends FlameGame {
  @override
  Future<void>? onLoad() async {
    var image = await images.load('klondike-sprites.png');
  }

  Sprite kondikeSprite(double x, double y, double width, double height) {
    return Sprite(
      images.fromCache('klondike-sprites.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height),
    );
  }
}
