import 'package:f_lecture/ch2/animal/animal.dart';

import 'item.dart';

/// Bird 클래스를 만들어주세요
/// 그리고 Animal 클래스를 상속받으세요
/// 상속의 키워드는 extends입니다.
/// Animal 클래스에 String name, int age 추가

/// 부모클래스, 자식클래스
/// 부모클래스는 Animal,
/// 자식클래스는 Bird
/// Bird(자식)이 Animal(부모)를 상속받았다.
/// 자식 클래스는 부모클래스의 변수와 함수를 사용할 수 있습니다.
///
/// fly라는 함수/기능을 추가하고 싶습니다.
/// 반드시 구현할 필요는 없는 함수 형태로 추가하고 싶습니다.
/// mixin 클래스는 with 키워드와 함께 사용할 수 있습니다. with뒤에 여러개를 추가할 수 있습니다.
class Bird extends Animal with Item, Item2 {
  /// Bird(자식)는 Animal에게
  /// name과 age를 넘겨야 함
  ///
  Bird(super.name, super.age);

  // Bird({required String name, required int age}) : super(name, age);

  /// override -> 부모클래스의 함수를 구현한 것
  @override
  void eat() {}

  @override
  void sleep() {}

  @override
  void run() {
    /// 부모 클래스에 있는 run 구현부를 호출하는 방법
    // super.run();
    print('새가 도망갑니다.');
  }

  @override
  void sleep2() {
    print('잠에서 깼습니다.');
    fly();
  }





}
