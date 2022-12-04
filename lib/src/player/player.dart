import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:mario_bros/src/mario_game.dart';

/// 玩家状态
enum PlayerState {
  /// 失败
  crashed,

  /// 跳跃
  jumping,

  /// 奔跑
  running,

  /// 等待
  waiting,

  /// 下蹲
  squat,
}

/// 玩家模式
enum PlayerMode {
  // 一般状态
  normal,

  // 变大状态
  large,

  // 火力花状态
  power,
}

/// 移动方向
enum MoveDirection {
  none,
  left,
  right,
}

/// 玩家
abstract class Player extends SpriteAnimationGroupComponent<PlayerState>
    with HasGameRef<MarioGame>, CollisionCallbacks {
  /// 构造方法，设置玩家大小
  Player({
    required Vector2 size,
    required this.playerMode,
  }) : super(size: size);

  /// 玩家模式
  final PlayerMode playerMode;

  /// 重力
  final double gravity = 1;

  /// 初始跳跃速度
  final double initialJumpVelocity = -15.0;
  final double startXPosition = 50;

  // 当前跳跃速度
  double _currentJumpVelocity = 0.0;

  /// 玩家Y轴高度
  double get groundYPosition {
    return gameRef.size.y / 2 - height / 2;
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    y = groundYPosition;
  }

  @override
  Future<void>? onLoad() async {
    // TODO: 增加碰撞检测框

    // 玩家动画
    animations = _getPlayerAnimations();

    // 玩家当前状态
    current = PlayerState.waiting;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (current == PlayerState.jumping) {
      // 更新玩家Y轴位置
      y += _currentJumpVelocity;
      _currentJumpVelocity += gravity;
      if (y > groundYPosition) {
        reset();
      }
    } else {
      y = groundYPosition;
    }
  }

  // TODO: 实现玩家碰撞

  /// 跳跃
  void jump(double speed, MoveDirection moveDirection) {
    if (current == PlayerState.jumping) {
      return;
    }

    current = PlayerState.jumping;
    _currentJumpVelocity = initialJumpVelocity - (speed / 500);
  }

  /// 奔跑
  void run(double speed, MoveDirection moveDirection) {
    current = PlayerState.running;
  }

  /// 等待
  void waiting() {
    current = PlayerState.waiting;
  }

  /// 重置
  void reset() {
    y = groundYPosition;
    _currentJumpVelocity = 0.0;
    current = PlayerState.waiting;
  }

  // 玩家失败动画
  SpriteAnimation getCrashedAnimation();

  // 玩家跳跃动画
  SpriteAnimation getJumpingAnimation();

  // 玩家奔跑动画
  SpriteAnimation getRunningAnimation();

  // 玩家等待动画
  SpriteAnimation getWaitingAnimation();

  SpriteAnimation getAnimation({
    required Vector2 size,
    required List<Vector2> frames,
    double stepTime = double.infinity,
  }) {
    final sprites = frames
        .map((srcPosition) => Sprite(
              gameRef.spriteImage,
              srcSize: size,
              srcPosition: srcPosition,
            ))
        .toList();
    return SpriteAnimation.spriteList(
      sprites,
      stepTime: stepTime,
    );
  }

  Map<PlayerState, SpriteAnimation> _getPlayerAnimations() {
    return {
      PlayerState.crashed: getCrashedAnimation(),
      PlayerState.jumping: getJumpingAnimation(),
      PlayerState.running: getRunningAnimation(),
      PlayerState.waiting: getWaitingAnimation(),
    };
  }
}
