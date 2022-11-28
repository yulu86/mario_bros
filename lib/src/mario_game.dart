import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';

class MarioGame extends FlameGame {
  @override
  Future<void>? onLoad() async {
    await images.load(spriteImage);

    addAll([
      SpriteComponent(
        sprite: getMarioSprite(x: 52, y: 43, width: 16, height: 16),
        position: Vector2(150, 50),
        size: Vector2(32, 32),
      ),
      SpriteComponent(
        sprite: getMarioSprite(x: 71, y: 43, width: 16, height: 16),
        position: Vector2(200, 50),
        size: Vector2(32, 32),
      ),
    ]);

    final brickSpriteComponents = List.generate(
      15,
      (index) => SpriteComponent(
        sprite: getMarioSprite(x: 373, y: 47, width: 16, height: 16),
        position: Vector2(0 + index * 32, 82),
        size: Vector2(32, 32),
      ),
    ).toList();
    addAll(brickSpriteComponents);

    add(SpriteComponent(
      sprite: getMarioSprite(x: 23, y: 507, width: 13, height: 16),
      position: Vector2(102, 34),
      size: Vector2(39, 48),
    ));

    add(SpriteComponent(
      sprite: getMarioSprite(x: 23, y: 507, width: 13, height: 16),
      position: Vector2(102, 34),
      size: Vector2(39, 48),
    ));

    add(SpriteComponent(
      sprite: getMarioSprite(x: 7, y: 786, width: 13, height: 16),
      position: Vector2(238, 34),
      size: Vector2(39, 48),
    ));
  }
}

const String spriteImage = 'mario_sprites.gif';

Sprite getMarioSprite({
  required double x,
  required double y,
  required double width,
  required double height,
}) {
  return Sprite(
    Flame.images.fromCache(spriteImage),
    srcPosition: Vector2(x, y),
    srcSize: Vector2(width, height),
  );
}
