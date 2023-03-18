// 추상클래스, 상속을 받지 않으면 생성 불가
abstract class Animal {
  Animal(this.name, this.age);

  String name;
  int age;

  void eat();

  void sleep();

  /// {} 함수의 구현부
  void run() {
    print('도망간다');
  }

  @override
  String toString() {
    return 'Animal{name: $name, age: $age}';
  }
}
