import 'package:f_lecture/ch2/animal/animal.dart';
import 'package:f_lecture/ch2/animal/animal_interface.dart';
import 'package:f_lecture/ch2/animal/animal_interface_2.dart';

/// Lion 클래스를 만들고
/// Animal 클래스를 상속받아주세요
/// Lion 클래스 내부에 변수를 만들어주세요
/// 변수는 double weight;

/// 인터페이스 클래스를 쓰기 위해서는 다른 키워드가 필요합니다.
/// 상속와 인터페이스의 차이점은?
/// 상속은 1개만 가능합니다.
/// 인터페이스 사용은 여러개가 가능합니다.
class Lion extends Animal implements AnimalInterface, AnimalInterface2 {
  Lion(super.name, super.age, this.weight);

  double weight;

  @override
  void eat() {}

  @override
  void sleep() {}

  @override
  void hunting() {}

  @override
  void cry() {}
}
