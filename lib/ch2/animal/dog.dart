import 'package:f_lecture/ch2/animal/dog_interface.dart';
import 'package:f_lecture/ch2/animal/dog_interface_2.dart';

import 'animal.dart';

/// Animal 클래스 상속,
/// interface 2개 구현 (implements)
/// 각각의 인터페이스는 1개의 함수를 가지고 있고,
/// 함수의 return 값은 String, 입력값은 int 입니다.
/// 함수의 이름은 아무렇게나 지어도 됩니다.
/// Dog 클래스에는 weight 변수가 있고,
/// swim이라는 함수를 만들어주세요 -> print $name가 수영하고 있습니다.
///
class Dog extends Animal implements DogInterface, DogInterface2 {
  Dog(super.name, super.age, this.weight);

  double weight;

  void swim(){
    print('$name가 수영하고 있습니다.');
  }

  @override
  void eat() {}

  @override
  void sleep() {}

  @override
  String play(int hour) {
    return "$hour시간째 놀고 있습니다.";
  }

  @override
  String wake(int hour) {
    return "$hour시간 동안 산책했습니다.";
  }
}
