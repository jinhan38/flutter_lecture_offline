/// animal이라는 클래스를 만들어주세요
/// 변수(프로퍼티)로는
/// int age
/// String owner
/// String kind
/// 생성자 입력
///
/// run, sleep 함수를 만들어주세요
/// run 함수에서는 -> print = $name이 달리고 있습니다.
/// sleep 함수에는 -> print = $name이 잠들었습니다.

class Animal {
  int age;
  String owner;
  String kind;

  Animal({
    required this.age,
    required this.owner,
    required this.kind,
  });

  @override
  String toString() {
    return 'Animal{age: $age, owner: $owner, kind: $kind}';
  }
}
