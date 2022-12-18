import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:mario_bros/src/mario_game.dart';
import 'package:mario_bros/src/model/const.dart';
import 'package:mario_bros/src/model/player/player.dart';
import 'package:mario_bros/src/view/game_view.dart';

abstract class PlayerComponent extends SpriteAnimationGroupComponent<String>
    with HasGameRef<MarioGame>, KeyboardHandler, CollisionCallbacks {
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

  @override
  void update(double dt) {
    current = player.currentState;
    position += player.updateVelocity() * dt;

    _removeIfOutOfEdge();

    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.keyA) ||
        keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      if (player.direction != MoveDirection.left) {
        flipHorizontally();
      }
      player.run(MoveDirection.left);
    } else if (keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      if (player.direction != MoveDirection.right) {
        flipHorizontally();
      }
      player.run(MoveDirection.right);
    } else if (keysPressed.contains(LogicalKeyboardKey.keyW) ||
        keysPressed.contains(LogicalKeyboardKey.arrowUp) ||
        keysPressed.contains(LogicalKeyboardKey.space)) {
      player.jump();
    }
    return true;
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
  }

  void _setupPosition() {
    position = Vector2(
      unitSize * gridPosition.x,
      gameRef.size.y - unitSize * gridPosition.y,
    );
  }

  void _removeIfOutOfEdge() {
    if (position.x < 0 || position.y > gameRef.size.y) {
      removeFromParent();
    }
  }
}
