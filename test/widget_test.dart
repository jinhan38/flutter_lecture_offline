import 'package:f_lecture/ch1/collections.dart';
import 'package:f_lecture/ch1/conditional.dart';
import 'package:f_lecture/ch1/for_loop.dart';
import 'package:f_lecture/ch1/homework/ch1_homework_conditional.dart';
import 'package:f_lecture/ch1/method.dart';
import 'package:f_lecture/ch1/operator.dart';
import 'package:f_lecture/ch2/animal/animal.dart';
import 'package:f_lecture/ch2/person.dart';

void main() {
  // Variable();

  // Operator();

  // Method();

  // Conditional();

  // Ch1HomeworkConditional();

  // Collections();

  // ForLoop();

  /// Person 클래스를 만들었다.
  // Person person1 = Person();
  // person1.name = "김진한";
  // person1.age = 33;
  //
  // Person person2 = Person();
  // person2.name = "홍길동";
  // person2.age = 300;
  // person2.weight = 60.5;

  // Person my = Person("김진한", 33, 70);
  // Person my = Person("김진한", 33);
  // my.weight = 70;
  // print('Person : $my');
  //
  // Person my2 = Person("홍길동", 300, weight: 75);
  // print('Person : $my2');

  /// 장점
  // Person(name: "김진한", age: 33, weight: 75.1);
  // Person person = Person(name: "홍길동");
  // print('person : $person');
  // person.talk();

  Animal animal = Animal(age: 10, owner: "김진한", kind: "말티즈");
  String run = animal.run(speed: 50);
  print('run : $run');
  // animal.sleep();
  // print('animal : $animal');
}
