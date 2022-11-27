import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:mario_bros/src/components/foundation.dart';
import 'package:mario_bros/src/components/pile.dart';
import 'package:mario_bros/src/components/stock.dart';
import 'package:mario_bros/src/components/waste.dart';

class KlondikeGame extends FlameGame {
  // 卡片大小
  static const double cardWidth = 1000;
  static const double cardHeight = 1400;
  // 卡片间隔
  static const double cardGap = 175;
  static const double cardRadius = 100;
  static final Vector2 cardSize = Vector2(cardWidth, cardHeight);

  @override
  Future<void>? onLoad() async {
    var image = await images.load('klondike-sprites.png');

    final stock = Stock()
      ..size = cardSize
      ..position = Vector2(cardGap, cardGap);

    final waste = Waste()
      ..size = cardSize
      ..position = Vector2(cardWidth + 2 * cardGap, cardGap);

    final foundations = List.generate(
      4,
      (index) => Foundation()
        ..size = cardSize
        ..position = Vector2(
          (index + 3) * (cardWidth + cardGap) + cardGap,
          cardGap,
        ),
    );

    final piles = List.generate(
      7,
      (index) => Pile()
        ..size = cardSize
        ..position = Vector2(
          cardGap + index * (cardWidth + cardGap),
          cardHeight + 2 * cardGap,
        ),
    );

    final world = World()
      ..add(stock)
      ..add(waste)
      ..addAll(foundations)
      ..addAll(piles);

    add(world);

    final camera = CameraComponent(world: world)
      ..viewfinder.visibleGameSize =
          Vector2(cardWidth * 7 + cardGap * 8, 4 * cardHeight + 3 * cardGap)
      ..viewfinder.position = Vector2(cardWidth * 3.5 + cardGap * 4, 0)
      ..viewfinder.anchor = Anchor.topCenter;
    add(camera);
  }

  Sprite kondikeSprite(double x, double y, double width, double height) {
    return Sprite(
      images.fromCache('klondike-sprites.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height),
    );
  }
}
