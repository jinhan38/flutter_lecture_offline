// 5가지 타입
// int 숫자(정수), 소수점 없음
// double 숫자(실수), 소수점 있음
// String 문자
// bool  진실 혹은 거짓, true, false
// num   int와 double 병행

// 값을 설정할 때 3가지가 필요
// 1. 타입, 2. 변수명, 3. 값

// 변수 선언
// =, ;
// = : 33이라는 값을 int 타입의 age 변수에 할당한다. 넣어준다.
// 이렇게 할당을 해주면 메모리에 올라갑니다.

class Variable {
  Variable() {
    int age = 33;
    String name = "김진한";
    double weight = 75.5;
    double weight2 = 75;
    bool check = true;
    bool check2 = false;
    num number = 30.4;
    num number2 = 30;
  }
}
