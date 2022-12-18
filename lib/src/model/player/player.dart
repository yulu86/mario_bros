import 'package:flame/components.dart';
import 'package:mario_bros/src/model/const.dart';

enum PlayerState {
  waiting('waiting'),
  running('running'),
  jumping('jumping'),
  crashed('crashed');

  final String value;

  const PlayerState(this.value);
}

enum PlayerMode {
  normal('normal'),
  large('large'),
  power('power');

  final String value;

  const PlayerMode(this.value);
}

class Player {
  final _horizontalSpeed = 100.0;
  final _verticalSpeed = 500.0;

  Player();

  PlayerState _playerState = PlayerState.waiting;
  PlayerMode _playerMode = PlayerMode.normal;
  MoveDirection _direction = MoveDirection.right;
  final Vector2 _velocity = Vector2.zero();

  PlayerState get playerState {
    if (_playerState == PlayerState.running && velocity.isZero()) {
      _playerState = PlayerState.waiting;
    }
    return _playerState;
  }

  String get currentState => "${playerState.value}#${_playerMode.value}";

  MoveDirection get direction => _direction;

  Vector2 get velocity => _velocity;

  /// 跑动
  void run(MoveDirection direction) {
    _playerState = PlayerState.running;
    _direction = direction;
    _velocity.x = _horizontalSpeed * _direction.value;
  }

  /// 跳跃
  void jump() {
    if (_playerState != PlayerState.jumping) {
      _playerState = PlayerState.jumping;
      _velocity.y = _verticalSpeed * -1;
    }
  }

  /// 失败
  void crash() {
    _playerState = PlayerState.crashed;
    _velocity.x = 0;
    _velocity.y = 0;
  }

  /// 更新速度
  Vector2 updateVelocity() {
    if (_playerState == PlayerState.jumping) {
      _velocity.y = (_velocity.y + gravity).clamp(
        _verticalSpeed * -1.0,
        _verticalSpeed,
      );
    }
    return _velocity;
  }
}
