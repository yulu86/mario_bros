import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';

class MarioGame extends FlameGame {
  late Image marioImage;

  @override
  Future<void>? onLoad() async {
    marioImage = await images.load('mario_sprites.gif');

    final upSprite = await loadSprite(
      'mario_sprites.gif',
      srcSize: Vector2(680, 1252),
      srcPosition: Vector2(0, 0),
    );
    add(SpriteComponent(
      sprite: upSprite,
      position: Vector2(0, 0),
      size: Vector2(680, 1252),
    ));
  }
}
