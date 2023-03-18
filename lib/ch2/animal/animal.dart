/// animal이라는 클래스를 만들어주세요
/// 변수(프로퍼티)로는
/// int age
/// String owner
/// String kind
/// 생성자 입력
///
/// run, sleep 함수를 만들어주세요
/// run 함수에서는 -> print = $kind이 달리고 있습니다.
/// sleep 함수에는 -> print = $kind이 잠들었습니다.

class Animal {
  int age;
  String owner;
  String kind;

  Animal({
    required this.age,
    required this.owner,
    required this.kind,
  });

  /// return 타입은 void(비어있다는 뜻)
  /// 함수 이름 run
  /// 입력 값 없음
  /// 함수에 double 타입 속도(speed)를 넘겨주세요
  /// return = $kind가 시속 $speedkm 달리고 있습니다.
  /// 생성자의 형태가 여러가지인 것 처럼
  /// 함수의 형태도 여러가지로 만들 수 있습니다.
  // String run(double speed) {
  //   return '$kind가 시속 ${speed}km로 달리고 있습니다.';
  // }

  // String run({required double speed}) {
  //   return '$kind가 시속 ${speed}km로 달리고 있습니다.';
  // }

  String run({double speed = 10}) {
    return '$kind가 시속 ${speed}km로 달리고 있습니다.';
  }

  void sleep() {
    print('$kind가 자고 있습니다.');
  }

  @override
  String toString() {
    return 'Animal{age: $age, owner: $owner, kind: $kind}';
  }
}
