class Person {
  /// 생성자가 필요합니다.
  /// 생성자라는 것은 클래스에서 항상 존재한다.
  /// 생성자란 무엇인가?
  /// 클래스를 복제할 수 있게 하는 함수
  /// 다른 말로 인스턴스화 -> 메모리에 올라간다는 의미.

  /// 클래스 안에 있는 변수들을 프로퍼티라고도 합니다.
  String name = "";
  int age = 0;
  double weight = 0.0;

  /// 생성자 1
  /// 클래스도 하나의 타입이다.
  // Person();

  /// 생성자 2
  /// this = 현재 클래스,
  /// this.name;
  /// 생성자
  /// 클래스를 생성할 떄 생성자에서 프로퍼티(변수)의 값을 받는다.
  // Person(this.name, this.age, this.weight);

  /// 그런데 클래스의 생성자에는 여러가지 형태가 있습니다.
  /// 생성자 3
  // Person(this.name, this.age, this.weight){
  //   print('Person $name이 생성됐습니다.');
  // }

  /// 생성자 4
  /// Person 클래스를 생성할 때 name과 age는 반드시 입력해야 한다.
  /// 그리고 weight는 나중에 입력해도 됩니다.
  Person(this.name, this.age, {this.weight = 0});

  @override
  String toString() {
    return 'Person{name: $name, age: $age, weight: $weight}';
  }
}
