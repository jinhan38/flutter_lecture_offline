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
    upAndDown();
    simpleTest();
    compare();
    logical();
    typeCasting();
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

  // 곱하기
  void multiple() {
    int age = 10 * 20;
    print('Operator.multiple age : $age');
  }

  // 증감연산자
  void upAndDown() {
    int age = 30;
    print('Operator.upAndDown age 1 : $age'); // 30
    age++;
    print('Operator.upAndDown age 2 : $age'); // 31
    age--;
    age--;
    age--;
    print('Operator.upAndDown age 3 : $age'); // 28
  }

  // String format 테스트
  void simpleTest() {
    // print() 안녕하세요. 저는 000입니다. 제 나이는 00살입니다.
    // 00 항목은 변수로 만들어서 넣어주세요.

    String name = "김진한";
    int age = 40;
    int day = 4;

    print("오늘은 3월 $day일입니다");
    print('안녕하세요. 저는 $name입니다. 제 나이는 $age살입니다.');
  }

  // 비교연산자
  // == => 같은지 체크
  // != => 다른지 체크
  // < => 크기 체크
  // > => 크기 체크
  // >=
  // <=
  void compare() {
    int value1 = 10;
    int value2 = 20;

    // 같다면 true, 다르다면 false
    print('Operator.compare ${value1 == value2}'); // false

    // 다른지를 체크
    // 다르다면 true, false
    print('Operator.compare ${10 != 20}'); // true

    // <
    // A < B, A보다 B가 더 큰지? => B가 더 크면 true, A가 더 크면 false
    print('Operator.compare < ${10 < 20}'); // true

    // >
    // A > B, A가 B보다 큰지? => A가 더 크면 true, B가 더 크면 false
    print('Operator.compare > ${10 > 20}'); // false

    // <=
    // A <= B, 1. A보다 B가 더 큰지?, 2. A와 B가 같은지  => B가 A와 같거나 더 큰지
    print('Operator.compare ${10 <= 20}'); // true
    print('Operator.compare ${20 <= 20}'); // true

    // >=
    // A >= B, 1. A가 B보다 큰지? 2. A와 B가 같은지?, A가 더 크면 true, 같으면 true
    print('Operator.compare ${10 >= 20}'); // false
    print('Operator.compare ${10 >= 10}'); // true
  }

  // 논리 연산자
  // && => and,
  // || => or
  void logical() {
    print('Operator.logical : ${true && true}');
  }

  // 타입변환, 형변환
  void typeCasting(){
    int age = 30;
    double weight = 80.5;

    age = 50; // 50

    // age가 int 타입이기 때문에,
    // double 타입인 weight를 int로 바꿔줘야 합니다.
    age = weight.toInt();
    print('Operator.typeCasting age $age');

    // weight가 double 타입이기 때문에
    // int 타입인 age를 double로 바꿔줘야 합니다.
    weight = age.toDouble();
    print('Operator.typeCasting weight $weight');

  }


}
