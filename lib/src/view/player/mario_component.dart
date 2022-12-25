import 'package:flame/components.dart';
import 'package:mario_bros/src/view/player/player_component.dart';

class MarioComponent extends PlayerComponent {
  MarioComponent({required super.gridPosition});

  @override
  Map<String, SpriteAnimation> getAnimations() {
    return {
      "waiting#normal": getAnimation(
        srcSize: PlayerComponent.defaultSize,
        frames: [Vector2(22, 507)],
      ),
      "crashed#normal": getAnimation(
        srcSize: PlayerComponent.defaultSize,
        frames: [Vector2(45, 508)],
      ),
      "running#normal": getAnimation(
        srcSize: PlayerComponent.defaultSize,
        frames: [
          Vector2(83, 507),
          Vector2(98, 508),
          Vector2(117, 507),
        ],
        stepTime: 0.12,
      ),
      "jumping#normal": getAnimation(
        srcSize: PlayerComponent.defaultSize,
        frames: [Vector2(139, 507)],
      ),
    };
  }
}
