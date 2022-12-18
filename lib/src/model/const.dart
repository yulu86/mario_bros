/// 重力加速度
const gravity = 30.0;

/// 移动方向
enum MoveDirection {
  left(-1),
  right(1);

  final int value;

  const MoveDirection(this.value);
}
