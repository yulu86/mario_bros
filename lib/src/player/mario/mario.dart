import 'package:flame/components.dart';
import 'package:mario_bros/src/player/player.dart';
import 'package:mario_bros/src/player/player_mode.dart';

class Mario extends Player {
  Mario() : super(size: Vector2(32, 32), playerMode: PlayerMode.normal);

  @override
  SpriteAnimation getCrashedAnimation() {
    return getAnimation(
      size: Vector2(15, 14),
      frames: [Vector2(45, 509)],
    );
  }

  @override
  SpriteAnimation getJumpingAnimation() {
    return getAnimation(
      size: Vector2(16, 16),
      frames: [Vector2(140, 507)],
    );
  }

  @override
  SpriteAnimation getRunningAnimation() {
    return getAnimation(
      size: Vector2(16, 16),
      frames: [
        Vector2(66, 507),
        Vector2(83, 507),
        Vector2(99, 507),
        Vector2(117, 507),
      ],
      stepTime: 0.1,
    );
  }

  @override
  SpriteAnimation getWaitingAnimation() {
    return getAnimation(
      size: Vector2(16, 16),
      frames: [Vector2(22, 507)],
    );
  }
}
