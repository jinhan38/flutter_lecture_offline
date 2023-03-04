class Operator {
  // 연산 :
  // 산술연산자 : 산칙연산
  // 증감연산자 : 더하기, 빼기
  // 비교연산자 : A가 B보다 큰지, 작은지, 같거나 큰지, 같거나 작은지
  // 논리연산자 : 그리고(and), 아니면(or)
  Operator() {
    add();
    minus();
    divide();
    multiple();
  }

  // 함수
  // 산술연산자 더하기
  void add() {
    int age = 30;
    print(age); // 30
    age = 30 + 20;
    print(age); // 50
    age += 3;
    print(age); // ??

    String name = "안녕하세요";
    print('Operator.add name 1 : $name');
    name += " 저는 김진한입니다.";
    print('Operator.add name 2 : $name');
  }

  // 빼기
  void minus() {
    int width = 100;

    /// 문자열("") 안에 변수 값을 넣고 싶을 때 $ 기호가 필요합니다.
    print('Operator.minus width : $width');

    width = 30 - 10; // 20
    print('Operator.minus width2 : $width');
  }

  // 나누기
  void divide() {
    double age = 5 / 2;
    print('Operator.divide age 1 : $age');

    // 나누기 후 나머지를 반환
    double age2 = 5 % 2;
    print('Operator.divide age 2 : $age2');

    // ~/ 몫을 구한다. int(정수)를 반환
    int age3 = 5 ~/ 2;
    print('Operator.divide age3 : $age3');
  }

  void multiple() {
    int age = 10 * 20;
    print('Operator.multiple age : $age');
  }


}
