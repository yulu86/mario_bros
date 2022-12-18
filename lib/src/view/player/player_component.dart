import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:mario_bros/src/mario_game.dart';
import 'package:mario_bros/src/model/player/player.dart';
import 'package:mario_bros/src/view/game_view.dart';

abstract class PlayerComponent extends SpriteAnimationGroupComponent<String>
    with HasGameRef<MarioGame> {
  static final defaultSize = Vector2.all(16.0);

  PlayerComponent({required this.gridPosition})
      : super(
          anchor: Anchor.bottomLeft,
          size: defaultSize * gameScale,
        );

  final Player player = Player();
  final Vector2 gridPosition;

  @override
  Future<void>? onLoad() async {
    // 设置碰撞
    _addHitbox();

    // 设置动画
    _setupAnimations();

    // 设置位置
    _setupPosition();
  }

  Map<String, SpriteAnimation> getAnimations();

  SpriteAnimation getAnimation({
    required Vector2 srcSize,
    required List<Vector2> frames,
    double stepTime = double.infinity,
  }) {
    return SpriteAnimation.spriteList(
      frames
          .map(
            (frame) => Sprite(
              gameRef.gameSpriteImage,
              srcSize: srcSize,
              srcPosition: frame,
            ),
          )
          .toList(),
      stepTime: stepTime,
    );
  }

  void _addHitbox() {
    add(
      RectangleHitbox.relative(
        Vector2(1, 1),
        position: position,
        parentSize: size,
      )
        ..collisionType = CollisionType.active
        ..paint = hitboxPaint
        ..renderShape = renderHitboxShape,
    );
  }

  void _setupAnimations() {
    animations = getAnimations();
    current = player.currentState;
    print("currunt=$current");
  }

  void _setupPosition() {
    position = Vector2(
      unitSize * gridPosition.x,
      gameRef.size.y - unitSize * gridPosition.y,
    );
    print("position=$position, size=$size");
  }
}
